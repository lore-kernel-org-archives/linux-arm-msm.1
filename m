Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597227;
	b=esBqVXPIkXnCmPXgmS2gN/J1W2lWPizcmwzFYSarE8KcTcO/7DFuzB5Ngp4hOU1joupb
	 I4q/28RNJYQd1x6mopWbk1Q85xAoCCKM4+2Inln1xmKt8C17iYM53k7TYZ8vQaugnZ7d9
	 KtQDbZCpyCKCrnI1YF68fUbi9Pz8DL+fU2pZ9JpCjoeRxgCNmH8agt7gF8ftAQgYCX137
	 zXyZ260ewb5mdYfK8gS1yh9/tofLdQ5MhkFYaxMyjvUPIYno8lOZifUQfoja6uCgZYzow
	 Z46RYBfOL3xfBwrly4sQ1mDGSSVxipDUOniXU58mLvA6jt04w9xh1+PsqREUwkh75bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYnjwHdhjpw=;
	b=r8c0CYBwswfufkAIXr5Bf49RzHOaPqloMtN8h1170QwLI31bvWG3jqDdQOmZMS8ym9bF
	 XBVViTEs+Q3gwjhiLn8B8HqevGuqJsC46xCdnCypu89O+UdRmaNvAqr9tye9WzDMnDbpV
	 kzOi3oDsb+yfXVygy+UD2rHV2t6mY1PDbqnm1L9sFD3NyOWJVSaUVAmw+1vvEPw4o01WA
	 EMXrZneV+T9pjtzkOzGbNJr9oY+KShTaxmvYCTXCzRstzuHVBMUfJ5rgOE+pTIIi+qmhD
	 OBRVWdFQakt3wRf5rsrL6uQ/ecnLrmX9Ta3FC7ynt6SqtJb0Z+pVxb0WALjf5SVGCFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2KdVGQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y9FzzRTC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E96606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E96606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2KdVGQG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y9FzzRTC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68pHM3807898
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYn
	jwHdhjpw=; b=Z2KdVGQGJ3ZuAORpm6w142Mqk5T+B5R+/F8Ky7u+FzBaB3ZnPfw
	TBHpjTzQ6R9GJ/FLTUK76r6N99pKERDTKeDLXxTswnNxCL6YoyfAuppVlj8lxXqf
	mrtGvTgTUsS38REMgsqGHMNPCCtDLtS/yM5OaqxANJTRUzP+dlHZX9Yo62Xdbryr
	jxyteJaj75eSUZJJg9O0yCU2OpUpTvyHWMXkiF8SOq+Wx2w2k/JrhtUu2CkgcKxC
	n7bvoLxCwgt1+EwiJzIShpk3uvJgQsI2yfx9fKUAcsWlMBH9M7fBkpMEkQ8H9tdd
	4olJnEh3hOfWaJSXOZ0QMwx9MRbOgzZOgXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbwys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:00:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fbso790988585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597224; x=1796202024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYnjwHdhjpw=;
        b=Y9FzzRTCDo8NPJJFnKt7u6nQzfV9yNSWOI3YCBQeBk3c/0VLJ5NL1yHA8JooidvwMI
         w8d4KhN0k+Y/GLjUdJW+wwAb5uGEE67csyMVeagm/Z1+PwpnYYriOLzRkBEB1J9aFJog
         8D19xwytU5LJAufqyvAyHLLsL8cEoVASkW5T3m6Zoe9fnF4pl4XHHsdp8iZjjBL3nPJv
         f9Of3Enh1lwSZ9jWY2fqzItRS1BJQjcQKG3JFWQXznizOYywgI4anKAuCKXcJ5YLQ1WW
         Yl+gndS+vq16F6H0414tlv0DJHVKZXvyzI5pz+/TSKwy9/v87Ws+nL8nZdJox/5GmITo
         io/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597224; x=1796202024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYnjwHdhjpw=;
        b=YvvByP9EZFS/4XRqfP5Uu6zIXEghXm31TcrQX+JJSZHMEdnR0GYGuKNufTCdEpDaCK
         d0ase6vB0690oK4Jl3Lf7UeQb0Ww0JsPNdS8ta9t9Zm9L1kf3p+0X8vF33OvusQteg7C
         AL8wYI4kqGpznMtdtMTV9gMTR6BODwzcofnaVBPwHVsIS+ewpJ9ywsyRW2VGc4YCySlD
         KTKny2pccCsFfpWjndEnLqBG5/b5EmXDS3eleadnhy/cDrRMoMKkfqHZKFHgnunVxSsQ
         hx4vDW0htkyYgY8YxHLYIQO7KVRyyLatIoXUCgSVj7bI4i81oo0avUgeox3FkAzqQrwL
         eUsQ==
X-Forwarded-Encrypted: i=1; AL+hErFOl8vfTMfOD/7Jt4QbuuU4LLrWX3LJMzCBvxysKGXPxSUD70oYfKBgC9d1+/wov+3qzZtHJz/808Gt/i/0@vger.kernel.org
X-Gm-Message-State: APuU4Z8AWyh4vgW0/6Wj6Us1jQju3qIV/mOQ5OVwTloO/UgzIs6Mw+TH
	A2RNABz94cI3N4Jf+rYOabGFcBq+SEbREWvDBNn1kOpeB2xc+5p41dOMz9KJfouuCp+5XMIl1bV
	gknaMHweFSXIeGO6B6+5pm/devoUwZjaeoVQg1WtRhwP984kxknZ49MzoBZE1gCyPIZHo
X-Gm-Gg: AZFdTZdsObwXEzD56UhEJPGI2ZtyW7+g6h0OotklPtjHS0U2S1oZXdeCk8QR9O3BeF/
	YPn2AOd8VxQ4dolAw97sRnUkk06jy37e6G4htK5mc1IHK7Vai2hV6UoaisA8p7t1uVbglycnyyE
	UEAsgGFEVxnKQm7tR3w6hhXWY9m1iuMTvtXvIa4FA+qxue1mxVHECXqcnsXWbWW/045XTe0M2AE
	XnNPvbkLsSvZl2FGlLqsaeZh80I8lPlDTPN09JMQSy+ZjYn7hXxOGUiWg5aBsxxDvnSD1rPgB8H
	EMMh2D74Ts0++bM2bg1uodo1KYNLfEho1UTT002CTChTMkdIc55LrKFqMBifOTRysVGi81SDB9r
	mRWY7SxqBFJbRRO9EWnSUavORqhnGAXlOWCzTfhi7ldvClZ9AIceMU7ikTL3Oyg==
X-Received: by 2002:a05:620a:46a5:b0:949:3f0b:4cd5 with SMTP id af79cd13be357-949bab1631fmr3023492885a.71.1795597223757;
        Wed, 25 Nov 2026 01:00:23 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:949:3f0b:4cd5 with SMTP id af79cd13be357-949bab1631fmr3023481785a.71.1795597223007;
        Wed, 25 Nov 2026 01:00:23 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm30805138f8f.34.2026.11.25.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:00:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        brgl@kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable FUSB15201 Type-C controller driver
Date: Wed, 25 Nov 2026 10:00:17 +0100
Message-ID: <20261125090017.26981-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX080bEV/OeZe4
 x0QVMDtMFAawofVnc8FL2kpXLL05tL2A2aXHp8hTxyrlgjE64BpSe9iriHXpCRtjbHgCeZEQf3S
 +lqPLTjzoZ7CKirZnUr98OjFWWr6SLJcPPDnUV9+Np326T2C34EoViHqX7RyStaWUSQcn4hxTrM
 H07acldYj2B/IWPD/TwTnTEQqQb7txO354xCdcI5ixuD9CZ+zuthu0+H2U1KlVRxhWcYv3pvJ0K
 b5jzK4pAx7CGrQQIG5RDNBuqKQVJpkOZ0hnwsg22csbNsMXm5/ZVRgtsvLWEXb2lKn09nF3ciCS
 pmvBLYfy5YlF3aGBGj6Y7q+CH8bntb4ENALzWV9twincMu8xD3UkeWLZ+fvrKM2nOI94AIcLRBr
 KJd7CajHmZR3oYWgCN0Z9TiAiLiQi03DtGSoIi/6H/3GCYmIuB9lKn/zAD1mCa9MNCRw54cSjtb
 dKjh0lN4L56kW9ji2fw==
X-Proofpoint-GUID: rFD7NYxGwnGbx3nr8uSyCYcthA2xAqs3
X-Proofpoint-ORIG-GUID: rFD7NYxGwnGbx3nr8uSyCYcthA2xAqs3
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06a3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=3RVehInwFxL8co9N1jMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfXwIklJayhiC+7
 GtCjffewqPkQEmoTbF0+7uMzIb4StZ4CPccq2QXzxLs7JI7kO8TmH2wcMUK8z0kcbR/I1ecVFgI
 Ezxf4ywopTq/hvkXl42OZd8UdqyduW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250035

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Enable Onsemi FUSB15201 Type-C controller driver which is needed by
the Qualcomm Nord Ride SX and RRD reference design boards for USB to
work.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a228..5d4bfebc796fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1279,6 +1279,7 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_RT1711H=m
 CONFIG_TYPEC_MT6360=m
 CONFIG_TYPEC_TCPCI_MAXIM=m
+CONFIG_TYPEC_FUSB15201=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
-- 
2.47.3

