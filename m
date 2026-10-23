Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746214;
	b=gJn9jhrFLvjUiLHilqTcnB8zDztQic7Rw8E19qbpLwHDKnNUjrhysDO7eqr58V4Do4la
	 2Tp6ZsOm9kxXSYaj3JX383sf2PtvyUDI2q+Ed3VJi8VB8GrIvFH+TdW0S3aqX2JbYNBIp
	 8OmzOsYdqFwPDAPJQu1NTGK/vEHN1ZrdEFuj6ro0XSYDSIj9QARLWalJohouwBOm87cwc
	 CfRvteDbffLh0SH8SSvBm8Zr/w8LABeaR+/Th/gmbzGzAVO2UbU+wlwG0ssTQavyY/Crk
	 gPCKcJwaf9BC8VoQfFxQ0IiiE1SU6Hih4a0O/acuBcpZGfbHccUhKy5CY55Hi6aphLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zizJUYpF90Icu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=;
	b=Z25Fpar6pRhlMbHAsEuzhO8CZ0FQy3OMWgvo/hHDaQD0COuUefMvXKY6jnlw3Ap3n3um
	 6qHOXvjq0oMwTTohDik5+D3UrX0gLN8Y6I/53ATPb/vz4kYxQPJKbfZZ0b1K/qybvQiBY
	 Da6Gpk8rTgiKYXrUzdkHXQ5em5EC0NQm5XcdYUV+w5ayy+d86zlrxx0ZD2qtXRNKgkAK6
	 0u0iPR3IploBnJJ16PzUiTZEhk4OIdqojlwqdZpPXeaYup9QqppA2SRH37+U4ilk7kF7X
	 IMGthjzGI5Ct3jJFuUwGlKex5VNbi/caXCAeMnFDW0uNkIs1oUX/FwhDTxBPN3zezIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hJ/LqxFH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=km6f9JYe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64562606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64562606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJ/LqxFH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=km6f9JYe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FGFB1767427
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zizJUYpF90I
	cu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=; b=hJ/LqxFHflNTHadd//qNX5plcNF
	qo+hG3Jl0Hv2usG9aarPvOGXDkQS7QbJjC29isFGxQTMGuDurPIOM2X0zyil74fq
	G82o6puo5002gvp7InM5G9aKCVpou5uL4CVJtOmzQfjIOqzoik8nLlcWvpewIHkc
	bMw6wQJBLOy/glPuKuvO08FIUytOQc4LMwzHBrHdpEuSola/UZyWNVUjejm17hjS
	zx3kwHB11uU6qV60qM7pd5vhHI+yPx9gBidMnn5xVHJcTy4xjXwEyMfFs2+Re+aX
	CTahl/YpUyxOSQg+se2V+hLKTuQaDNG137LZHJxWf7kFU6qc74rpQl+zyXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahua93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so402590a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746212; x=1793351012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zizJUYpF90Icu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=;
        b=km6f9JYeKqUfE1bcKSAFQIquIjtXfqbs+/JUeq00uvY1peM26NCXF+5jbX0ibUc9uN
         eZCxcn6jhBrLQQZPyxR+4cxPfZbC9ChSjdBBWJEH1obcRD163RVgees3DtQbZWP4PbYP
         X4ONsPFoHlqDeDuUttWqzSx+bMMTSxOU3vj5RaBiIQNsqLO8NtMA5irb7NhAnvfW27j9
         p/SLxwQsGRotprr+lN8LvYDfT5kbc2eEj/hMG44W9ponHYgmvoVxsqp1ycx9086KxSRm
         vFSJbp6eMmNYhbxbL1FdeBJFZHESaS1zxRzjED+9fnR6gH72BvgYSssVkGS7amrITY/a
         +xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746212; x=1793351012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zizJUYpF90Icu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=;
        b=rQoKLKL0te03LO/iqyeq3YQ+1aWiUTyahLXUW65PSZkrkpvlVLJnaf3mkAOBBKaFsv
         WXhVWKNs1QVh47sb0vKFRZykCy/Ok6yNLg7kcImZO4i5gnk0u2yUlMiRKtZ1zW76Gibh
         naZLFiCcgyL4gjD9KLedsnjzaFX/4jtw47cqB8ixR7XpLvrGCckPWOVZdl4icTqZj5Od
         oPmyHClevoxxQyN6kdy+oqkPEy1XqWy+QnCJEPNeCZ/yS1Fra+13oYcXMKwBzjSVOLNI
         SKgCTahAQcTLIIeg9kziuqvoTl6LvpwDwqKxZQ+xMGzAvB1MeeT5bCZAAC1QDNZHMEbO
         OhCw==
X-Forwarded-Encrypted: i=1; AKwUvBxFvA/6ZMv2gmRC9dFgBG3nb6g9UaMnoBih76xNyf1+Aj9QR2rEzVaa2xpl/FfA3MnKr2cBgbnxp2nEWEcA@vger.kernel.org
X-Gm-Message-State: AFq9FYIMWOGuXARncc903Jr1JHSEEbOz1ga1/dWsqGg2FlwpTw8HvC18
	WzVKNp5kOXjvfTpNNfYmLWJ+Yt1YuSQxQfRt1jW4OJpvDdezuXq9BJ8TgXAK67RcWr65idOEU5D
	7MeA5LoKts1swPa6GV2Hr5kU72dYjcRw4eTQTeRsARIMnFpx9mBHJTpfoPvk52OE92S0I
X-Gm-Gg: AYBFou1LNRPu3uQSlhObF7PUc7P32KTmBdzrYDXx85Mm9qJhvNbZSvVg6Cm4VdxhhnG
	6QqeJefQncUJes91xq+cDoLN0F+NwGgL7pCiqmP1WEXs+XggHIMrNBlUwaawoR5D00TpdjJobI6
	SRap6WvETvo1QzmrZX2xlcaqDgARoPYoHG6pjvebgLYpGn2MNIlofygZ6SB+6Sju7KvM3jUqZ/S
	s5RqYZ7xEGOZhgfrxgUv93Si9sVMJ51HSEPkdPUMgp+jdR8Djdm2pNkTPo+4vt1pWHhu86VKqKf
	Ovk0MvRdibkaVDRZQfbj+fzOcqVNeg+FkOj59V5lObezj/nGXu4mQBeaIxmsSJApYqfCdwip38Z
	O/Yc1K4a9nI/Vbh7vimzEJemPgjj5OtmbiQ==
X-Received: by 2002:a05:6300:618d:b0:3e2:91f1:3878 with SMTP id adf61e73a8af0-3e359a416efmr1359341637.10.1792746212343;
        Fri, 23 Oct 2026 02:03:32 -0700 (PDT)
X-Received: by 2002:a05:6300:618d:b0:3e2:91f1:3878 with SMTP id adf61e73a8af0-3e359a416efmr1359311637.10.1792746211896;
        Fri, 23 Oct 2026 02:03:31 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:31 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:05 +0530
Message-Id: <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX4Ej+z4hehHGG
 6pKepA/rF5e9yhOx7qjn5tv5SP+pPYF3/grA4zVaPwe/V+2EHuveLO2vPCOs5udJgCQdgq5opGz
 lyn1D7LAK2s9/p7d9rfEZoT6gAls/eQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX63OGj+5cNJ/Z
 1o1waxhn/Zf7uSxdbJDZuYeUoAM2brD5BYwtQslmLidWZ0iY9R6m4Bbvg4kUaPSX2E392+JaLdj
 BpAurMA3r3cQX7JJLIKJt/OZEJiTJOwKFyZ38CGg+qZpGwCcEQ6aDa7ZYE1aLLeZAWusG5zuaOy
 h8MmtjflYJDuVNhGlNsf0GgmN72dAgCPZRYrOF63idKYBnBfVAfY0Aful5liR05JtZAfHS3GupK
 zdtce5ynfVMsNtDxCYw4aVqqeQlh6hbtbYqpi1ISFOwbY78IMJhGydvLfIfWuOLup1jc+ob7g3j
 Z1DjC3vRzR3njMXF+Rn2MmDD5D51PsixVmWVa3Nk1tb5Nj6CMHaBwN0TU0On3sw936xjy50ux21
 hzdp+5YSj1W1x+yBQCEYtQtYCYNnepRRDiw8h3P5wjOY91pyAscT9jOmTzrJQVRxRBb46h4wYbg
 IBIyefjnBM+eFGnmlDw==
X-Proofpoint-GUID: uEZH0hXIxKXc2aFD9JVG6sexgwfVhVcn
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb22e5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PKVKsYk1ooiKBYXMgQMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: uEZH0hXIxKXc2aFD9JVG6sexgwfVhVcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from sc8280xp device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..3a26377aac5c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -6279,12 +6279,6 @@ compute-cb@8 {
 						iommus = <&apps_smmu 0x3188 0x0420>;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x318b 0x0420>;
-					};
-
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
-- 
2.34.1

