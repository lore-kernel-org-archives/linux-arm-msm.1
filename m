Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834331;
	b=unY9c6vc7YnooFt8SPqWwTY/Kn49swmQkazuqJtRGQAcvZcO4vF3G2/Mbh1eJ9Httvjn
	 fymm2VgpDKBvaqeGXipc/oHP8SLhE3v/gzigH0IdlGjN+ryDe/5640mt4BJkaNM9W343F
	 AJ7B/B/R2OCrCsHUVSy9OdNScz7g7pfBP8dtt+rOLtItpXZ4JHvpEh9fpsEjt71fbfyPK
	 XD2LLzyTPb44n/mOEcB6Fl9OxMUnX2W3/mB4CxxqHUJ4L5Clks5XYUVt/9pWDV331uMcN
	 sV2uQDBBj9jz8xokwZZ5ImgaaxuQzSGN6F5OyILSfd9smWqalHP1LZdeNlzqC2liZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
	b=pGsg0B505gik3o1WPp49ae85+3SzpUnwpozutSWdAqKyp43NEpLYkyWezSpVMcHpv1F5
	 VkUAq1C6yyPP05Th1gToV+T3HiUn/ypYsoMPU4ksVUyKEVsMrhQOW2XkGEXe1Pwkd2kqX
	 4zxbLVi/2LCAl1dO4Lrn+MilmRwHwW64y6C0IrzepHWLp1oEss7pnA6e/yV4IOU/SOZPG
	 y7kxo2gJYrhzp0uV714OW1z4cLc34Z8Zz0PRoGhXOw/tvC4fR/o00itppEINqyYbpXoVA
	 XjouIT8YYmgbLOogDiMRzNCe9Aid4Xr/xL9lVxCSS5BmnPOcw4ssqyTC/rtcb3FonNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPyvFpnL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xfc1Fo/o";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489D606A338
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7489D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPyvFpnL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xfc1Fo/o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0qZh1482659
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V
	3YUcBNu4=; b=bPyvFpnLgRKyROklELXNtZQ5kZezDQv1LObub5nqvucMHSGdO28
	mlwgUIXfsQ+t2SsrtcThzu9ume1EG6lshdi/LjOQcG1+onKmWL5TwCnDQeJcb3n+
	YYDALBsiH++ac/hT2paGFJfGjqP/G0FZm9jXbXAjht0KzuqTZVrCdWztVGKecsAX
	//HB/5el62HwqZIWpahyZvSbDhpbGZaW4o11S/ulfK3vlAViGmvzkYrIXQu8cirx
	WU2O0C1c64FNMhmWOZgDzNAwSo2DgVfED2i00nB9pkVcLbx2XxpWOXQPoTKHtGdn
	qkGXJhaEr4+DtakrL/5Xz2AD233PBX0iueg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgm3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:28 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so4108413b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834328; x=1795439128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
        b=Xfc1Fo/oSW8NVU2lqDz8umoMtSKlSPD/QCYq9VXrPvPnMHCUwBbBtHcmP7/iVpTOoI
         8BHxKBHbr4rQ2DUIyqKBP9mMXcYp+8t3VVn/0PleZN5xzEvozN5KE/XdUMoooVO0lkor
         Apz0xaxKjvMOAj/SaUOlUfxGyu/+W2RXldV7qAM0I8STu6UEXNqlU5q3z8lbsoCXtru/
         HpYoz2keKF1E/BSH873Db//9smYhWm8XB8J9P88thRUp7X/vIDX/hc0S/U6Hs5c7T13f
         KnzaAFdA1Xg8GmjrdYetlz1sKcdJGv50OTwBVEvglhSohWu9U9uLAx9ti4vIVwlHiaWf
         dLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834328; x=1795439128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
        b=IW7HxxTPfK5XcEj0QUx0oGNpTpdfMrY+AK2iGDMJj2DjSLCRJ6fHDJSeUdLwxxQOu4
         Kr5sabXnr5BfEIulDo3l3vQisSEuJ9u/Z5z1nD3fGKvdTBtV8lnLC2WeaDSrBWyaALMe
         T8ja4oAImzVewuTMtkc/halOb++UVUOystWOEJoiC/AGRPfXe6ESVyAfMm6Lyz04D+xv
         F4lhrDFK/EZtJ/y3Yl7xoutUD/MrqdGF2OU85utu8leMoajs/3sYwiGixiFsjrR3c7rd
         gf0wrz0Lc8gC/DA60ktZjRJdClh2EcPUs8UxndQeZHbiRuQP4Snj+SLiqaMLUJC2NtaW
         ThKA==
X-Forwarded-Encrypted: i=1; AL+hErHNB16r9yBi1hhyxs1oM9GeN3ATCPzPAh7huK3ZrJGYCNvxjtbv2Bn6MB3Y94ZxL0LuL1A/zDBpGK7O1K4u@vger.kernel.org
X-Gm-Message-State: APuU4Z9UpckkvG+fdx5oBpMHCtcJ1MfiVBedj08/u28EtPdb8RFuRwa0
	WFe5iehLp5pmE8nlWg9HjX/s2sBtQHeYB5jjnmS1cgWpnv+d4miGR8nEmsp2+K2p7RtctduUOMG
	zdrd5t/eFjDtGzKPN9doV1OFxRJd8qF0ukSnV2Y2UfMnf9dIl07LxKkhfDeV7Hm2IrkRpaGhK5I
	ku
X-Gm-Gg: AYBFou2hBer7pG9kf4j/YVpOfmMmSnkGuqINaSAwiWiCws9mwONNPJHM4uBIxWDG8cz
	FxwpCLaOzUZ1p7tbgXeVX+brZMeKzO+16A9DvXKnWWDmI4bli91NaV0FYMjvesWteu9PhbnsM+m
	rQy+i44mn/w+NHNvxLYP5Vf5/d7rHKn9dFEnKGgjnsNh3SI35H0Vv7wu+GD0ECLMnjCOUDndYxx
	HnrRhOyt1mPqpy1NsSpD1bt6lvdo0+zcUihcorFHfTnQ+GJz6ft6ZYFMtd5RLSQsRKyQAtUJEB/
	Lt9NDG8n5NB+dg6x0y/3oMRjlZYip84Mek6TYZ3Zvg42/erP//oGc9zBr7B+cx70EScjks83SpT
	wyZfV6n5N3AzvWhUpW+iHyCn0D9/uDOqExpjvAF60GtKl67E0C9COppRGsxFukVDCFIuO4zep7F
	Hk
X-Received: by 2002:a05:6808:4fce:b0:572:f1d1:d6b3 with SMTP id 5614622812f47-572f1d1e88amr4376803b6e.21.1794834327997;
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
X-Received: by 2002:a05:6808:4fce:b0:572:f1d1:d6b3 with SMTP id 5614622812f47-572f1d1e88amr4376778b6e.21.1794834327578;
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 18:35:18 +0530
Message-ID: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaff98 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: FEdvs3UDtU_h-7a8gI0M9tXVBpFb2mbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX7HBO+zKIjOY3
 CTlfTRP64nHGpN2nAstMjbWzko5z07k/lp9Ky1tur93d/8VnPdT+zBzNAvcCqg5nkNiiEmy5lBD
 zi4a5TYmsSuhLryV/uQuwqy9KvuxdQVqTtLC0ARv50oAnncCnCxzmupQgjKXZhLwNom8qL8gftd
 0A/r0eBx2zKibPGUu9neo2ARnJz3d40xwPuDP/oipO6SPySK8FPDY6TT+P+crWm7mSPm01n8x+r
 c+n+8vihFyxGNgeh577LXnPzw8blA5GSwfiRSTxjFCZWmhVNcvPHdddhmFVze3IEQzxqsU0yDvN
 S1XKaJ+eFOv3zuh3CU5IxGVD9uj+/NXEWgxjZUaXB7sElajQT16J8hW/DBDM+ixSX+robvHYtWW
 G/Rngxv1olwhlDi+mDY2rY2Zqh4oIncRTPlqZbFeCfXV5zqNtiTe3EDVUvNyS6C2PKReSrkLAxo
 yrYgylqQfA1CmsxiV2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX1xNksqG5QoPf
 NkK23DR+z7opWTqygiRBas8FwJ7Bmdd0nSu1MqbGcTJCL6AlbsD1uV39ZIrHKA95aQFqIIldo8u
 v3ldFdQmAfyCIGFjErZG3uGoPX8WjMg=
X-Proofpoint-GUID: FEdvs3UDtU_h-7a8gI0M9tXVBpFb2mbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [v1]. 
v2 [v2] split the change in two and addressed review from Dmitry Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

v3 [v3] only added the "v2" tag that was missing from the individual
patch subjects in v2 (only the cover letter had carried it, which
caused confusion with v1), with no functional change from v2.

v4 adds a base-commit trailer that v3 was missing, again with no
functional change from v2.

[v1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[v2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com
[v3] Link: https://lore.kernel.org/all/20261116120623.1726089-1-akash.kumar@oss.qualcomm.com/

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)
---
base-commit: 87d33c3916a82e38eedec53f4afcf2c620add47c
change-id: 20261027-talos-lyra-evk-v2-v3-3-658fd5a7ec99
--
2.43.0

