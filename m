Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193274;
	b=SZESVjvzOkcbLuXUHfMIfiyxZqCvwtcbDTQwimadIL1dCyfAlcpV7/gAhfIGaysHSVGa
	 wdAEnBLEf0kfIOxOavwP2RHR5xkHKKS1RenQVCvIQX9jIssPn2ZntpXQdJVZxNAjc92ve
	 5A0Yj+76U2rpGxZqTY9/nzVHB0+x2B/sxazvDEO176SJO7kyDkQvDTx4AWRKY2+e+zn4A
	 A/PxnIEK4jp56fd75esPwBb75hZbdqqKW0fx9YA96EIcG9SYvymYw+k5+y3olU92iX03V
	 Rf18o4ksnF+o4LVFrwujIh3VeafmhtHpx5EESY+cI+MaxCfipUSsno1LjNXumrTTolg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
	b=i+0M0lmyNyGyk86Y1YqU1x2lI7uE9G4dEJtGrrpiw1MUuWpXU64Rk7IsI3fxS2EUg6h9
	 K0fllL06KJy8rk7EBR5qNr6XpkCMVY+NRwi8aIoh20C9dF+4zAoZvymEhomkTGDcF5iml
	 YdtNIRjgUewl9CDBWAPQ1CjYIeWXb9EDdkEJppVqbSRFNPolJUXo9qcH4aailn8YwQ6qz
	 7ZOo2M0uwf0HfBl3x6wCPvSeaVhsA2lEJnSPkahQla+6WYkbmTguk2wIbu8riglNRVSxZ
	 xbuQLngIck49JKsBMuxgTdrlm3E6HLo0ilr3Ab/aP8yZTYCfMc0hJgonRhwzw3S7DDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9BEfN2x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Vvdl+u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35A606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F35A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9BEfN2x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Vvdl+u
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAes1606928
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1x8NaV8HTu5gAeslmvpR8F
	GTVuxugxIE8fzlISP3bnI=; b=D9BEfN2x/o5w0fry8gHuNT+065VJseNTU4AECb
	tI9MxVxRvLwD+SX/3G5IxMMQvuy6+e+S9c1np1Qm5LkUamkZqRn9k6apfDfpVVbj
	nn3S1rR/H9VAVQt/tBAO7eUQ8QH9DTzJy6UTQtGwrcoNtfMGrJ79hnVvfM/JWXib
	HB+rMY7+fmQotBA+bCu9g7f4YbBgKbYB9cjL8qdyTeOGs6LyZBDNqsnaOQObjfBG
	y/iHys9SfqO3SynMjNa7TrXJN7qayjqtjkNYGgRZQ1l0vYhdRizIMx6C2VlkZy+6
	JEvPYM67qoGQ/5jhO/0FXg+A7ng5dtzTVzjNCKncjxvLBHAw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jaju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:14:32 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6f8edf0c859so2572393eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193272; x=1793798072; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
        b=h4Vvdl+uUBawzI83pkPIQuPRjI+/hWTab2r+6ZEOjhKX5TBH1tSvaSbpZYyyoEla51
         PnYzdgNbSAOR8YOZOu4X+dTFMtSQH3VhQuRX2bP8fVynLqJlDgFt9ptOTp88ioCcwFUZ
         zyJhFf2YxYTbPkbtHSoqhtrcELxrmWDaWj+GOfADzUcmM/BWL1OBGw2y8AbvVYTzo9s9
         15URYorqEkAoyH8BLO0B88tjUH9lVWlWGYfkj/JjSR6eq4VOHZIXKBvpdbAUOjUDtpKO
         Xb9qg+yYEDY3Ky0hUDb88GQKCSu5WlLPAENeIv95oP9eRraarXHgEEL9LCgsNmzEaLew
         l+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193272; x=1793798072;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
        b=upQA096xJWtW+dAlsJrYEXVRp9hopwlck5GIdT/kHOetAy85+vtVrviXIk09DWVy10
         /5F14T5pZv5pd++udegQZNDzAQ8SscyRYPN7/BCqIatTWLjRg9LUo8uzSvGmLMTiw+kA
         x7dNTuEMxawV6mi25xaufqHDCacljwsNIsVySk9/pxgQ80Jmj0XfQockTyo5lKFOyfOK
         vpc5ag/kHGYBG20atPBdXBemKyEh+V0CR7hTEbhUSKomaNMJ5a+38YmkM12D6EMCw3lD
         P+aEII00HGGMnom79Yz3u3Fg5t+3pUNTKzDVsJ1cHKvWfQf/u1EqmBv2e4j66w+a+ymz
         m+PA==
X-Gm-Message-State: AFq9FYItTVJQm9QTcd1MDEDPSPwQdsRIcUOOcPpMldtybYAUUUghQ8HC
	mcDabK+YxYS8pZIIRe8R975Fwpa6WvBCh18NP+ONv1OsXU4/7kMnGazzyjdcgd+x0zVmzQf3/BA
	cWwTDbPkjoY4ywrt48BIE4tnzYq/OhHOa5QFs1Pc4Gm/j5L1BA8PWfyiwaMD41HeIoeVxbIuCG9
	3K
X-Gm-Gg: AYBFou1Zg1X5OgOfliIscTNhbCqUmewXHnKBM0f4eVeJdnXNbwl/oNisytL+pyRJ7Vh
	mONOGoqKuwUrRAe3oBd1/3F1XZemBxhd2FxFwt6xCzhIaq8z5E/dIIvk80FZ8TMdxBlhMXClOdj
	/DJi/CSFMlpR8O1OUxod88UGw8xLL5y4R3XTffGUvFfLk7th8bX7kFTEROy0mQisYG8zWnXehNc
	p+S/xs5DGbcGWEk0AZ8N4IEHb5mTnIfAu3wiLPWN4RCNJsUCNu5W2Q+TZDL3vYElIUllvPGm7nN
	bn7CB/fvNCGmVxx2617d77PpVZlPayOlRw6WSfw5G11AcnBIXs7+LyKuj/D+g/FEKO5poua/Z8Z
	GJTT/pHA/VGoOf7v1f2+OwdAc8pe2dhA0CIgQ5Wfzty7WhlxCjWESV18Tb38xiwBIQVGUy76Ikx
	dpTOoF2Bcq
X-Received: by 2002:a05:6820:4dc3:b0:6f8:a519:d932 with SMTP id 006d021491bc7-7126ca44809mr3108347eaf.53.1793193271791;
        Wed, 28 Oct 2026 06:14:31 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc3:b0:6f8:a519:d932 with SMTP id 006d021491bc7-7126ca44809mr3108326eaf.53.1793193271362;
        Wed, 28 Oct 2026 06:14:31 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b788a09csm2388074fac.10.2026.10.28.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:14:30 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:44:20 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACv14WoC/yXM0QpAQBCF4VfRXNvaXZH1KpIWg5HQDiJ5d4vLr
 /5zLmB0hAxZcIHDnZjmyUOFAdS9nToU1HiDljpRUqeiG8+Sl02YpJWRim3UGAO+Xhy2dHxPefG
 bt2rAen3ncN8PYNq8HWsAAAA=
X-Change-ID: 20261028-gly_spu-96f0315a3d99
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793193266; l=1176;
 i=monish.chunara@oss.qualcomm.com; s=20261028; h=from:subject:message-id;
 bh=Ty8iQjHsGQajgTDh0m+gmK4J0o90jMAVhZuq2fkNuPY=;
 b=6x6YWK04xaRVG0/5I2sTwxDR1sy/HprH5IUZ2V3JqBhJQEHnbOWi3R8P2hH44si9M5d8AB3Qr
 yHS3KJlAuF8B8vKiGahC1x8/Fi0S4smi0qKL7VPYJo/QSm5u3j2mz+G
X-Developer-Key: i=monish.chunara@oss.qualcomm.com; a=ed25519;
 pk=R2RFu13c+46gfzaTikqwEg+aoiYYnnwa2sLE2QOs+lY=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX61vu55iawUtG
 tUZR4qy5VEYPmZKZ7VDFTZLwBTtQer0viuG2Fk+nnk0PilUXs5BlDipCl1dC/moww7Awu7BGRRt
 4f/Q16R8Nx7chfwC9/wcgiNoj8p7Zhk=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1f538 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=06sbhgvwvL4e3_yMxJcA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: 0Z6O1zUNdnl51pORShbtt3PR8G03gu1c
X-Proofpoint-ORIG-GUID: 0Z6O1zUNdnl51pORShbtt3PR8G03gu1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfXyhcEz3Ge+THe
 PJuzA6Lq1MAXfnnJjmalyKxRSjKEzSrDvsBPZQIx8KH/2zSRv7iSKzWw789DhPqx6PI4egZZY1t
 p43Sn/0zTtgqkE9cvN+WXyyZG9x+B9eDSiVgqif4vi4m4fHonMCINFsBopGP9x4LVH47uRISq60
 a2NP58WByZQ5l4wK5dxQktHMVNyAC16fWus4uJ1ZVz8cRIFHaOPECYFhN9g4f8rguE4omvPJNAq
 bfkHMjYQQ2PJnpLo1xC9nKcS7Fav7IE2HRGO070f/eC0cZz9NvlXtZX4E281wPHyZrZVrs5usGz
 2kQsPKqPlcVmrNxJ7SvKlZ3PZ+GTNw31Src7hnXcpC5T5rlclLM0STRRAmkEXzy+zMiiz/Z1ayx
 Z7XDSBZiUXFVoFpnTbEnC85P+13KtCNDl9MP8HS9lvMrFT07dt+n+gFSDbSoADb+EFvOy8gjNqE
 pv+e8avaHOPqnJHDuzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

The SD card detect signal is active low and requires a defined high
level when no card is inserted. With the GPIO bias disabled, the
card-detect input can be left floating and result in spurious
interrupts.

Enable the internal pull-up on the SD card detect GPIO to keep the
signal at a defined level when the card is absent and avoid spurious
card-detect interrupts.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..a8f9425d8c77 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -1110,7 +1110,7 @@ sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio221";
 		function = "gpio";
 		drive-strength = <2>;
-		bias-disable;
+		bias-pull-up;
 	};
 
 	tpad_default: tpad-default-state {

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-gly_spu-96f0315a3d99

Best regards,
--  
Monish Chunara <monish.chunara@oss.qualcomm.com>

