Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794942;
	b=TD+a5YngZb/sTutQQZCm0Lal5iVDno2aPdPVIT/E+O08AuHHXg8QMrVBdf2Z0wpTggSx
	 pxLJ/eUS/uPHwMsjPh5ZFlx5CcCoddeCZkb91pofeF5wvlOL+3BhTuOl8Y2Kwi3zKfabz
	 TyGgcO7+4/K2oJtv3nEd2e/l+9SjHh1G6y62rnNZzxuSr3XLtFc/4NpEJIqeSd44B3QN0
	 UbIGzp3T+EPrU4hNMDUGGK6CtsYJr1znc7g+cb4VRX4FQBeXUIVNuvZ5rbJ8rnHsILzb5
	 emsiLZYMZR6vwQ9Pta4Xh31ILw5XSoOgMDHU3V96gIGvMCo/384Gx7yuxW9shgMhCPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
	b=YuOPKIe4TSYsYH7MdEKq+8Uo7XpCCvfY1fb0FxZbpUJRfa/ExMKryM6AlLqfxzYpJVrD
	 eCexFij25mkUTg6IqVFvMZiIYYpCPfhogrPEs1Wvw9crKmOCP1i4nGzPGN9V3YZCu1BOs
	 0Ytr+mlCFskJFRmRt2KEbN9OALDGXpImDD6tSfCV5kCton5Gps56LKoBSWjxR7TRWl9C7
	 ggLmwY/S/FlCOglQPA19EankoL8+VPMCnGYhm3/TGvOqQE79nYLAqB5HV/Qpp9/2m7B15
	 Xdz3ds5owMvnU3rgum5j0q4fCiHLyfgy7iZNALiMpJx+x1pOAvK2yg1TCf9vAGDdqpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VrqLql/8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC0606A6B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EC0606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrqLql/8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFox3t1703843
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXzrguSt16b
	KvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=; b=dTXtzdZyWeZRYd/GNpMeBB2pnuR
	TFkZsnGPJQcPVKJ+V48d6gkOl/DgxoXyhai+2o6osef6fWgTCfF7JSmroOfTwlK5
	rLEhZ2eLyme4c/htPanYEYerA5mGWrhHx1FcsjIPjK+/hygapRd9Epb1CeblhCNX
	hd5AZNCeuxX4WSdVvT2pPstTyKHfwJNaZKKVOeozSMwiCu52a1EwAZ9GaYisVF6a
	/B5nDncfze1e1uMuUxgIVAp4JE5vxqxCshTLSTIGCRaJuUNWG4UGNYHA78/RKRX+
	e5SrfxZkAEZfNfzLzP0uyjfY2VAnnBaPWnP9m4FrT9+X1HljG9pDMKvvr6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmp5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c6c1e082bso137091266d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794940; x=1796399740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=VrqLql/8foeES9Tvrh+Xkd/aFXfRM5epHuXARmnH31gJYeM+H/i+NYCTrF+4gZyAaC
         934eajCqZX0IGiUNFg8Ez4LHezV4xGggmXZ/aewn/KaXRd3G6XL2bkBxrTQD5aqB1/PL
         bUEPRxixFbYpWNXNKssYXsBowxnlXJJRPZpbrkpBf4g6rOrgnjLCjh6xi+AlfTSE1CAN
         mNqyTszcyTDav9+Gph4HJu1/eJYz0d1VhE6PK7h/oIhdZgqVMmmOWGossXOmkdVvJseE
         9I0P/JSzG7mHGB0rqSColiuIKN8PqId2gwhCR1AcRMD7lyqDxFiAoLiHxHsRllASeniz
         Ni2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794940; x=1796399740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=V0HXxMF3T/tFXrKnn8WIvrg5/K8a8l0dM8R8p6+pSQaH4BZ9MQQsv2OeB8MEDvbwf4
         n2Pnti/oL8+DZYLvQL+QgRC2V71DcanodZYdGOYc3Q1qaAQ8EPuwGgBeYXfReUQYgGqW
         3gzDQ1S5eaq/jP/iu+zeP1O0zVcyJMHzilhjffsU+g3EO4HQAf65FlsIm76cEyHB58/e
         RhHpDk6ZsEJJP7L1rV+lJ6TKxNi385hSrfW8bjSZ7mlvG26+3GCfmFE+hHj2o9uirWy8
         yj8dCF2TV1/qsJclOqNw8vt+8UI9Xx56fg08llfebH4Dj6eg1mmskkfx5xaZFKbkZt3z
         o7dg==
X-Gm-Message-State: APuU4Z9dTlOgyD1HxEVPLwDBNBtL7g20fxn7RIPBH7UrCS2Sfm8wQrU3
	2cx7YJJs5R+yzM85ezT5Q/BzHR1JnvAjRyzr0Ij+YnUeKnaANRDcZkk851P01qVJFTcRGOmhy0v
	vj8mYvHr5dj+lXww4T/O42e6yN0ZDZbXjvZgHtmftY8f93Q1u1FM1btaj320gvoJuLClx
X-Gm-Gg: AZFdTZdFhy+DbYkSqIcAMUgg3Drqc1gF+gwxXXBavPgO0/EDX9BePQdGc5FM2I6s+6K
	aulq095A7lk27xoHOceiyBCqydvVDEpTRgDBJ6XMvBQBCeoulATV/yuXvPExn0CjMo7F5h/sABp
	k2Rl7598hoo192I6Yn5p4+FMejaTkHWRMsouTZKIHDp3VD2K7ti1aZnEVzZN7EbISj2sW90TdWB
	7wq6hcrxbuxlecXBnqm/bYBNQp63nh36rGph9gNbbTAIZJjHxWorT7ByPVeNIFwuyW71vMUfhHR
	aE4RcV4wRDIavz4pEHr0BlHhcA60OaJ7IWyLR5v+sNSjmK1sEPyAphuhm9j6WEYTzg0b33bR4K8
	ZuSQTFNZ92TSWhFrTf1FBgtteUd5OWlL9GFww90zjhAYSAkhTgLKoG4hn1o09Oi+i
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431890685a.42.1795794939989;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431883785a.42.1795794939516;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:17 +0000
Message-ID: <20261127155520.358909-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: aWV0_5X9ZTR72YHq9jwOF3ooTrHekReO
X-Proofpoint-ORIG-GUID: aWV0_5X9ZTR72YHq9jwOF3ooTrHekReO
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09a7fc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX/F2zey4Ufl5H
 LH3zhBEGcn4V3nqJWuejojUrNv59GFZJApic2F5tU2eU9JZUS17hGxgIEQDGGdDx+xKqSl7ydML
 82WioOBBT80SSb1KoMDuj2OPTcu/KnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX2SbBx1Ly8VbM
 hpDcEEJJR6f2s3w+zXoKEp/4Ko6Dn2E7p/XjUsecdqgJ4OGvfRs462graLuSylYl/E8mzL8ZpJm
 uUVziu1ra0eY+LfvViCOXne3QQUWAHfmnGfKd6NczESG3iuEceKONJs23iXsyW4CHNy9sHa7O8J
 whcf6PLflvzGTYR6nbFJ39uWz065sUQY62Ll/tzd5i7JWBfNkF/Soikihwz5lFlBPUvJwEKebia
 IiYJf7UGnXDvVK41i7Nsoxiu98q9O96H+61P3Sseqv0tSTLdoCARFlEmAZv9+6LK5+f6Q+848sj
 cl4no391Q/2XhUnVQckM0p2LiU8rORy4clacpBbpekdM+uVh2HT+R/eEH9fxe97cK66nbIG5s1s
 bFLEVgiXjV5V3KgxWamQh5RvEiCA0xet2IvJQbiUfvRiLJ2Q2TWEYJM4lFtTC3D17jrhQOzkrE1
 q3hjvuv6J8DkMDA+cZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 8e0dd2956882..cdc24b273877 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

