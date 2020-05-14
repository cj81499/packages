import asyncio
from multiprocessing import cpu_count
from pathlib import Path

MAX_RUNNING_PROCS = cpu_count() - 1


class Optimizer:
    _SEM = asyncio.Semaphore(MAX_RUNNING_PROCS)

    @staticmethod
    async def optimize(png):
        async with Optimizer._SEM:
            png_str = str(png)
            print(f"Start:  {png_str}")
            await run_command("zopflipng", png_str, png_str, "-y")
            print(f"Finish: {png_str}")


async def run_command(*args):
    # Create subprocess
    process = await asyncio.create_subprocess_exec(*args, stdout=asyncio.subprocess.PIPE)
    # Wait for the subprocess to finish
    stdout, stderr = await process.communicate()
    # if stdout:
    #     print(f"stdout: {stdout.decode().strip()}")
    if stderr:
        print(f"WARN:   {stderr.decode().strip()}")
    # Return stdout
    return stdout.decode().strip()


def main():
    pngs = Path(".").glob("**/*.png")

    loop = asyncio.get_event_loop()

    # Gather optimize processes
    commands = asyncio.gather(*(Optimizer.optimize(p) for p in pngs))
    # Run the commands
    loop.run_until_complete(commands)

    loop.close()


if __name__ == "__main__":
    main()
