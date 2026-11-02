Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590521;
	b=C1QD/Lee+oERhskXpVoou9ZReCcxpaK31cNDSFmiFMN6AsjtDT1+bG03LbbGg1u0fooq
	 LtDo2DB86MuKG0j7FP+3QKklPWU+eNgiksFqNVxxCV+Qe1MMIPexOaLbgQYCwiOD4cj7y
	 dwECai1bPaBA68/+TgbA3lPSKsY5ALfkosdEhNQUgTOM0yOjWRjn+VAQod11CWJ2RKQ+t
	 7ZDFbOUiA3WaAHdjxrNG3Gg4gGXKx+OweFCP3Mb3JZGAbpnH2QYyH1pImr9uheD+2OPWT
	 T1+tM1C109UmRP7NBhLvv1zE2fKHWouALMFaJhDt/PfJ68IYvS/4m8lMzoJDnUDXemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s3hI9BgmMRPRT1boyeOjqhVUTHNSNjJIFs8Zzs06pn0=;
	b=n9Y0Q0hxLAqiD+5PBxtZ/ljPP7W2NOgEUfv74WpDA4IzZ9m8XWSSaUbKkepkXdVfZbHZ
	 qamq88AOSm175WPntXexjG/KxX3P+uY/6L/TPDGVLrE9GBQzjMZynIQTCqP81G3+QLcrw
	 nJ0fxvhOZx2yEsTM6E5SiJa/1ATXevwOY0fJgRx+OuD22fwfv9cO/jppUPVJpF4JEBHVV
	 7bmuobZRSRNoYgQaqhXDeLzKR/zb/ZIVR1Vxrp5sK7NsN+sNdDL4x+KJ8kWmJPCqC6Xup
	 ZoXSftW6JyO47DqFT70A9a6OkZIRHHeAEtxYVKOCm1xpifztx7B1SF5PxHzsjqNB2mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c/m2qyn5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScbVIZMS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821D606A336
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 03:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4821D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/m2qyn5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScbVIZMS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20KABI3264201
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 03:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s3hI9BgmMRPRT1boyeOjqh
	VUTHNSNjJIFs8Zzs06pn0=; b=c/m2qyn5vMQezhjmTm77x7IJhbrc9Cm0TGZNpS
	PoHFf51Q3AFeifq02peLVuFl+F9PS0Qz11H9IeHzHGPoCv/FHwH/rclsmXfLg31q
	QIpVc6ksqBWADSiSvRnn7+99nGECDfPcxQC05zcWgQruhaxza6qIDTg/qrdhLlnW
	lAIL/eF8KTfE7qi5fOMIr6vg3iAv2eUItTHIUrJbEumIBnsiTjS646gk8KK2ObdA
	QCGS70nK2EdC0JUOCgMWOWb8jxxNtSxSGKQymHQ9et0KtXO4uBg9d++TKBXtzluq
	FEaT0lgNWFbnCzzKik1YrC7E1Vy9JOhwBeG9IVZD4E/s/hlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fw9qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:35:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae62796dso30389295ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 19:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793590520; x=1794195320; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s3hI9BgmMRPRT1boyeOjqhVUTHNSNjJIFs8Zzs06pn0=;
        b=ScbVIZMS6GOuMwzP1tPrD3rKNCk1z00RbrrorEAcTJwdBexnT3fJL7ZEmE/kRGksTN
         +HpAMvszQoh7Ml7i3vMYmU2BDplCD532wuSmtu2rYFYgx99AEybu0BlL/DtxA5lVxRlf
         XjjrX9H9LOGGRs3VuvzTp8LrB31bFp/V8D0tc9MazgW18LAzXPMmeEQ+kGFmHo5v2Ikl
         BKaE0+Bu8JJ8UvxvBMsA9bb7pwh+9gcQuy5zwPikl3eUEogJ4lcpnzr01sI8Kh07qisx
         c5zXy90oiBN6/rc9revZp/OHOlC4u4W1ROCYwB7vpTCTE2H621tn3voEwqFq5RXEvqjh
         txqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590520; x=1794195320;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s3hI9BgmMRPRT1boyeOjqhVUTHNSNjJIFs8Zzs06pn0=;
        b=hkxED/2X7my1uOUThNwoFTZjjhurto/FjP9WHcllXazWjv4Z0MHnRLvacjnUztI9n3
         ALClGd0B2spwj29uSOoiDQVjQul4kWUYtfjPPJpQAvgxtxSYfMjZ3hhmxHfVwxiatSHh
         cDRvgtovtnAiM485TXKvFx96GyYu9JxlGSH90fLrzz7KxIQCb1EVTz9Z+EJiBUec8moG
         /L7ZH9dYL91KuE2KrPMJShss1wJp9KAR+crG50R4zov5jlwZQH+Isqb0ukfkz9GT6tHS
         m7FPq4NRjxrAB+M9+bdEio4u8buEjqLRSsoB0sPttuN06wXLmOmD6RL09JTXnTSWXjYu
         ot+w==
X-Gm-Message-State: APuU4Z9Iio8gnd0pzNm1P5b5acpBS9e+1qVbuqp9BhopSE/busyTNiAp
	vXYVYaqdzS4Z0cIxcPLwr4CQofSuwafK8NuMtu8tm9iwaZnRi7mHXUsToNLGj6uI9nyM/q35Q+r
	CXKiSbPp2udzEq5pijdNCjYLqW69RO0L+R0M0ZzTBewXYcriIIcETH2ROfx2yN7O/zfEeUTAvmK
	Yl
X-Gm-Gg: AYBFou0SyNMCMDwIPHotna8JF//lrkB6HyubzRuvb75ukqC22s9Nwobpc7e5eQdxUEQ
	ARD+X93Rr9cUBg6b3L6CprkDFGrXztn5D4JoX0MNjMA+g3J8LnAkS3K1OXGLTv/y6aq2tkiSKvZ
	b7Ghw2GumOsdR2FVAFjohSZcqarRwaSBfs0d8hSygbYPEPBIILvF4dCLJP07/U5+aSKlTndtBro
	c7cAh6exi9FQY0elhg+1M4vQLCBxbostZExpcZkjqk8LiqCTIkybqSu3EHOQmfFiPRHpBD3GxAP
	EYCKdki5+IxS0hyIV9sq4/cn+xyTthMT89lLRAlYszNQAo3rMe9KVbX0nCL+HGjicBrqf/DdGYq
	8LV3lNGBNErTEjBwB/XJ5lrPHQrkT5XUzwQ+tA9PLzZUN/3mmw1nQM/xJtMc8g2XxuMRXNWhDHR
	m1682Fb2WOXQ==
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ae89750f64mr5670493a91.28.1793590519605;
        Sun, 01 Nov 2026 19:35:19 -0800 (PST)
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ae89750f64mr5670480a91.28.1793590519104;
        Sun, 01 Nov 2026 19:35:19 -0800 (PST)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm16518459a91.9.2026.11.01.19.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:35:18 -0800 (PST)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 09:05:12 +0530
Subject: [PATCH v2] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
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
Message-Id: <20261102-nord_stats-v2-1-0f690148e7c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO8E6GoC/02N0QqCMBiFX0X+6ybbbGZd9R4hMd1fLnKr/VMK8
 d2bRtDNgQ/O+c4EhMEiwSGbIOBoyXqXQG4yaDvtrsisSQySy5Lv+Y45H8yZoo7EUIuyMFwqsy0
 gDR4BL/a1yk71l2lobtjGxbA0OkvRh/f6Noql9xNX/+JRMMG0Uto0vCpMqY6eKH8O+t76vs9TQ
 D3P8wdej7t/vQAAAA==
X-Change-ID: 20260907-nord_stats-ea163d025d43
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793590516; l=1565;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=EP4kQLlv2vwvwZdXnPvyaRHo10aAXL2YYWFP0/VZTHs=;
 b=qBl2BmGMwmTcJJacNIt+6fdKNvf7HAVaP5hEqInnrCiDLiFflYbS5uNwEvHtlrDRszO6cJ02p
 14t+8OdfGwPCglZmAul3ol2aH5zMsBQQKy454nTLIBINkoWramLoJ8Z
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNCBTYWx0ZWRfX1AV3alSX8CaE
 DkeGC0I0flSmAUG94RMLmEtq9iu/XW3/l/iyGM1ly6Cpdk1AYupCqJGtxK3zQsdXUF7DBpSfQ2W
 wodDDe9XeUD8TGZ74HreWY/fpHM8kag=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae804f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JoL_3e-GhyZJABErYZ4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CjktLd3m7rD-9UXF5Np_ZmifynCIOiap
X-Proofpoint-ORIG-GUID: CjktLd3m7rD-9UXF5Np_ZmifynCIOiap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNCBTYWx0ZWRfX4V8i4LkVu47l
 xeJL+6ZzF/cyit5If1gpEGU6By0fcgCSuLEPRTy3Y4VMVurEJBiJd2ljTvQjhcVbYx/JSxTPw8z
 O61Eybr02IwMJXrGtbUKhjo9jnkxC80JKFoxLjoXlAkBc/tT1gCy6Dy/5DAICFxiOA4MiFyiMaj
 tsiHlCQk3RZrmo23le4ZqfK966LUUgrO3Vz/ZcmNtoV21QoQ75PDM0L7S+r6efIMWXECiK6t0n4
 x/ibnNtS7QKnWjaEuTPv6vaQQ/7F57CEX1aC2G+nByLnvuWdDeqJKGXhcc+e5lIemb3j3k7A97u
 ZoqoXxIcg5pZu/baNArZyGJJn9PTe9XkaMnRc+CibrM9xZ+a2s6nVsRTMKYL73z5925ORrDruvL
 9TaEA5e9guYmd9lzM0aIgDSkXkvY5MCn6vHd08YjS/z7c1QCgK9y4RmbQU9IdI70UUjbRjLbQid
 V3wX7+hocD+8c6fschw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020014

Add SMEM items for four NSP subsystems stats which are present in Nord
SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
id. Add new entries for NSP1/2/3.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
Changes in v2:
- Add comments for the cdsp/cdsp_nsp instances with further details.
- These comments explain on the naming of those instances.
- Link to v1: https://patch.msgid.link/20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/soc/qcom/qcom_stats.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 06923408bfce..2ff0123a7804 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
 	{ "modem", 605, 1 },
 	{ "wpss", 605, 13 },
 	{ "adsp", 606, 2 },
-	{ "cdsp", 607, 5 },
+	{ "cdsp_nsp", 607, 5 },
 	{ "cdsp1", 607, 12 },
+	{ "cdsp_nsp_1", 607, 69 },  /* newer SoCs (Nord) use a different PID for cdsp1 */
+	{ "cdsp_nsp_2", 607, 133 },
+	{ "cdsp_nsp_3", 607, 197 },
 	{ "gpdsp0", 607, 17 },
 	{ "gpdsp1", 607, 18 },
 	{ "soccp", 607, 19 },

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-nord_stats-ea163d025d43

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

