Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691873;
	b=kpiSiQ19Hl3rC1my8Iudqn3vj4QEFi2NfKEL/LomVdvZB3o0Yn5WoUlzMK7BFezA9mRs
	 TKNN5i80CeI2ObTU3n602s7MC7wS0bNcQGddLzOeBfF9qhejhvhirYZH8ijlRvRcZK1AN
	 +dObWIw1dcj7P/caAcF2ha6L0+8MuUSyxSr/7EaMbOTC50NJfdfLF7r7gEoM/pu/+t94J
	 vDLpe5HAuMCTK1MiZj7ze/AwarginB/K2Tfw80Xr+56vGscx0WALwlB/btpDfnmVAO9OS
	 kNoxTM5c+xRdAVNXNhMYg6Xl6uWkWBv1P4JBWlODTXs15OKfFX63PC/tuDMf0mmLwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
	b=JSw1hLZp7MD7Kd1RT3wqLzXW90iRr/GFgwUMqlEl9gYuY1KMBfuBFD0dDvVvEofRnhnd
	 iK3nSuQNDapTZsCWFaNYlhfg6SrtOa2lZSkMlhV9264FsiHRMBlzzjJc21uB0JOnK7pfX
	 oTOTJg3EeLElf6aEGZalc/wRJGL434uEAAbnCmP7Akd1fWmfraxPOmoS3JvocVYx4kZab
	 CPH5g9zW94w2RpkWxheIGIsiXQzZMuM3seL1CRzYdvpJado+kROP6pY+UJekw++lpknX7
	 0rNlZMtAoE1AkSf85w2qm1W7LU6v8q4RsyH52fOdpsXiHqaqXfMWQLymGU5g5nm+GBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3hmVTVb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTAjEPJf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C9606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3hmVTVb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTAjEPJf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHpin2727079
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=; b=G3hmVTVburM98xk7
	B7qB5mcpHxodDCYqnHJCtcmoNaorZvEjLvLFM+IxukVmknInBtwBrdxsxE2y4KcY
	XU6NBj+QAgT4wAxJYYXULrqZjWQCeLmo8iUe+tJ8JrGS2G+2BUj1IDpNyC8jVl34
	YxncGYEC6Fn3VECvm/7CwH0Gq6TJySiAB2PtS3w7iM6ybTlROnE33HFtJ7028LfB
	cITc3hfSenCn685LThBuARjH31qAS8DUTehWtOFaLMpZYzNbrC0zTwasXQi/nVNn
	2/egM0HymlEuZrvBO4pg/SrjArxrt4siLxi5J/1vlY2Uz9JfrDwpR4BCc1zN9i89
	9NT3Xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahv62y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:17:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5364f562140so129556181cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691846; x=1796296646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
        b=iTAjEPJfYlPJyXjh+xl1BBZXA8r7A9XLu4Azq5jEhUEFUtPglBVdpxkKbudz4ZcstE
         lrTp60U5JoDMA3uGXCIfKKdeY/2QUj3vXog2jXxtOkGesF8p4SXUUAbX2CWrXBe08HK4
         4/iyIOijVXQUssEY/9Zc4HJj2XU5XIFKIoom0aAUJqR465j9bhYQEd75K9hp8I1O9XCd
         /qZCwE87pdoMlLMlARfgo/7SL7lT/YvUN5xeskD9nRKdIUvW7asj9iNX53NdmkNAe4n+
         D1+wvz2W+s58BNxsX57PKg8d/EZQUklU/VFszRGuHeYh+1gQE1dvQAlDolfHSD8kVenK
         DSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691846; x=1796296646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
        b=beBq/cK8mWFJX1aJyGzurGHPWilSBItcQZG4y4O0UfqaOiPOd4om38O+c8HNk6TSV4
         YXY2vwxYQ9TvGOuJxoNmour6DyK7qXFRxO6HTGbriVLy72JKjqRkw5hOnl1g2za2IOQN
         ayFQcwEEy3RXPrqljX5cOgPmSIQemmw3Ew3GztX8ZviD6g0SJkCogl8mEJ+Hqec1eO1J
         Mi25UrdUa+1105h2P3/ZzlBvC+lYoNDgoRzdZZuu3C2jey47zfu0Po+9H1cJzdmckufz
         iviGcJ7StpA/IZLbh13wgFjkguZJDXs3tKPOD5llEUXn2kI+FiK5EgPG02KxZkY3FEnk
         YwHQ==
X-Forwarded-Encrypted: i=1; AL+hErFH8OPC/L5bTXBgHvJiCzZeEvnNPZpik9NeIAdkBMBf14baWAbFlb4dvEHRExAhqcTVkD5ijIN0QnjrjFyO@vger.kernel.org
X-Gm-Message-State: APuU4Z+4YhN1nV25ZfSuY16+akP1XcTqmpRAubqRp6asn3fPozMjNqPn
	MyU5hzaE1MEi4gRpSqfGzCbm8/shXegBoDEOkJDlNj6SiXXr77lAxF2fr7OrOAq06Xebs3ciiLu
	BDxjBGeA/y5AyrV9s1WlF1JUNMlRyFmFeOupgCPCw+dCvoBzmxvpdZKrXrBC8f9y0FVt7
X-Gm-Gg: AZFdTZdOOWOxTOejjTuaAkius8xSK/JWzeiuElP5K5zrXCIwA+n4vZhJTK67OXcUPpb
	x1z8XqMyAL3/PNJ+saXUXyLssy6R5Up6t3n1/c26n9lgxcScSVzukrpLT/5AiTkH22yU8ffDPBR
	wmE5vBHXjjf0/QhMr5sD6V9bmpkJY5i31+jNIoBlTrneDuVj3C+wlEs1WQCS1YzmV/BDYqH/W45
	C10CZrpBZrv35GldnOJ9O1GVrxUsIdoTK72FH/fHadp9NDEtQZyxGfdafb3KzIVESLI1xWTuKUH
	vfJPrKFt68ZQgiFX1OVE1Mlce777/v1gMilGQdTj91xXxis2fEOFt4/X59GtlI9JYLvMlnPHof9
	ce06ktZFfAx2SdzvULxoEsrc101BO79XuU4APoGSTivRmRCgkCrbUPeeBr6XNvS0MmQHrK0cV2G
	y2x1JlZ2xFDZrEJLHYQnorWtDGkTjQjYZPMJviXHcq5g==
X-Received: by 2002:ac8:59cc:0:b0:533:81cf:5c9b with SMTP id d75a77b69052e-55d6fcf949fmr396091411cf.24.1795691846017;
        Thu, 26 Nov 2026 03:17:26 -0800 (PST)
X-Received: by 2002:ac8:59cc:0:b0:533:81cf:5c9b with SMTP id d75a77b69052e-55d6fcf949fmr396091071cf.24.1795691845606;
        Thu, 26 Nov 2026 03:17:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:24 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:15:57 +0800
Subject: [PATCH v6 1/3] media: qcom: camss: x1e80100: Use the lite clocks
 for the lite CSIDs
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
Message-Id: <20261126-purwa_camss-v6-1-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
In-Reply-To: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jesse Casco <jesse.casco@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691835; l=2518;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=6Ey5y3ww8capTsBQgpxjXNOXFZAA+h5B/q8ghiZjkAk=;
 b=Q+PXM5oHGjjms4+wSi1VNOH8AS3KRM5GO5ftqcc8Dy0NN8kXh7GS7F/VCIqvskEOJ4Pz0Cwj5
 JmYdCdNht9XB4CVYujybPE8jvsdkOn9/CuuPz+AuvIw6oOm6FxSsdrA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: _wnOo-QKLkTZub5lc8esJTRPCM2xlJiO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX/Ngoy4M1NwsR
 bS3z+nDXIRuLWpNmNLUFJmidr9bDmvNIl4ZhjwkSlUa2/d59KDgDhqRrQvzbbWOd1rc6/4Pdhf6
 55Tlyz78tJWc2AWUlOlCbPBO6yUy4Wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfXx0aCMEfSmQaz
 9TvvufcpldvLryazSSbWYSHNGSeEzGTrank0Bmn3VHadwNStiD6ex8YLTHmXth+5vQ8IDZgocfJ
 dRS5s2L/I6mfRhh0i/VaCaAYGUztauQh1p7Omu4FPB2fI3yT+ub8ZncOfDhpi3gDZw3NMZ6uOI7
 AzZjl30M27TFBpiVQGGeM2flnA0eh1hgku2zSALYUhLujkSHFXKC7i5HLBfxjXQUZGAxjTjd7cA
 91lme7z6VEtDMDJR9LG9YVEjiP85/aViQZTpc4L8qZfdsEV0OymgI6KSs3NiGuOAjtssrJljHzw
 2GRPOdo9RWcBDL4i4m7VnZwVapO/gY6qWe4qhh1FFtld34VKzjtKPn7GN02RVGGJZ08/cERAY0H
 zn6gqFeOItuMCfmxflUE68eE+imwoHBOeRjq9dc1pTuMucavAlePELDvC3s8ecw8hYMsd+pB2/s
 tAJPpowVfU7HTOaC4DA==
X-Proofpoint-ORIG-GUID: _wnOo-QKLkTZub5lc8esJTRPCM2xlJiO
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08155f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lvRKaed-JQPLFg1lVikA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

From: Jesse Casco <jesse.casco@gmail.com>

The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
"vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
then run with their own CSI-2 receiver unclocked: their registers can be
read and they raise the reset interrupt, but they never report RX, RDI
or buffer-done interrupts, so no frame arrives.

Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
already use.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5469664dbc4ac2d6722d0555dbcbb1a10dd439c0..d3d27205af0dd49599fe0717dc8dde68a9afa638 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4567,13 +4567,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
@@ -4589,13 +4589,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 
 		.reg = { "csid_lite1" },

-- 
2.34.1

