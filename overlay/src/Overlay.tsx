function Overlay() {
  return (
    <div className="bg-[#161324] text-white w-fit p-4 h-[540px] relative">
      <div className="flex justify-center gap-12 items-center">
        <img src="./vendeta.png" className="w-10 h-10" />
        <div className="text-center">
          <h1 className="font text-xl font-semibold">Points</h1>
          <h1 className="font text-xl">Leaderboard</h1>
        </div>
        <div className="flex items-center flex-col gap-1">
          <img
            src="https://wallpapers-clan.com/wp-content/uploads/2023/05/cool-anime-pfp-01.jpg"
            className="w-8 h-8 rounded-full"
          />
          <span className="text-[12px]">230</span>
        </div>
      </div>
      <div className="bg-[#0a0911] absolute bottom-8 left-[80px] rounded-md">
        <ul className="flex gap-2 p-2 uppercase">
          <li className="cursor-pointer hover:text-zinc-500 transition-all">
            Points
          </li>
          {"•"}
          <li className="cursor-pointer hover:text-zinc-500 transition-all">
            Store
          </li>
        </ul>
      </div>
    </div>
  );
}

export default Overlay;
