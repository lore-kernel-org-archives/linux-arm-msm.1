Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517645;
	b=KwoS25QWer+UwJP/oq01CzgS+75VoWa6Ic9CA53Yz8lHRfKQ/R9fQVwWVsWwMiaEtasd
	 JQtvc1VeTWBuvDnT3eEF60Q20A0cygNIIshm3wbjZ3va0UrUtnU5nHKBQfFGB/dQoxcfl
	 8+tEDk0gnNVuZpqI7YDLQ8SD+Ao4ajJC0aOtLKbhYn4dSEQlk60OWkUmUhnbZvDPCIM+o
	 PUQaeVam0Sh7Jnq+4O4rSMBJjw45/F1EM0a1ZTldXkLYOoMoqwbHBuboxze020jdX61dJ
	 TV6Mo+gbdvoUHpsfZtpC/06Q8xNkyfLW9vyNCeZmKEQJHgl8IQBqgYogmU2itFs4UIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12Z61n6cMo=;
	b=jDeHybm01CxNjot68oU5a8YIUheT6x+7/+aU5yNA79slJvHWtBn1oFRncEwihngvqnxN
	 eVkLqQ8Da0Pb1B7hdG4bIEn6Zu0s7u9tFH62oLbEV+F0WOXd/oivjyexujl7IxcLjJROo
	 kbqj+zcNcgfv1wfFJJZpiBf/ZE3mwim4o++lwGbGNzA1orcmK8Gm9+Tgb+TNlGN0W2o1P
	 6MS8twfr963/+3wjdeMNPSkqXarvxs8S/6pN+Xv56+7JKobQtQkvaDa5T78qkQGWR0WXf
	 HUcIrOqPwi646ZLU//wgyzmzST5n3s58O21hDEJqs6gLE4KatT/ma7znhCh1f95g+zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eKD/FC81";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQEcDWtG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D8606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608D8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKD/FC81;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQEcDWtG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8N838197024
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12
	Z61n6cMo=; b=eKD/FC81T7rqmqlJgCYC64qlEiX9yY0DX/Gwk0jhCbm1U0g7EOx
	EDtiXngclXsuAHvV/+NyGqLBkgfoghqtPTokfhUbpkfq1UCxkRJJY/2pz2SMA6Fw
	5bJrkbE6c4txEJTS9rfEz5vqO9T26ObHyT6zJblbnr3Vq6aRkxp8H8+T5F0UNZJK
	NWoENirWMh4yqXdKGhLpsDZATHZwMeBvr1CfPFYspc1tIaDUk84CL3OdYZC1XKmT
	k8Rn32RHotm55hkPFZZvxh9czmxjwFOTqEdcihEbzvCaiIlblDTatFzWmN2bUEJc
	ydV2EggAyTugiMgs1PI/IeQzLt/3leiPYrg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb9ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so2563479eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517644; x=1796122444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12Z61n6cMo=;
        b=gQEcDWtGwvL5mHCWdClZPcFIKbwFetGRkgGI8vKD04EEVmhLKEudzBkGOvHiye5pDk
         RzZu8eb6gnDZkQoxiAGXI8WHwCoD4flM1nyG+3+jGjJf3i0Pm7hcdlk1aE6AXOZ4sLqX
         LbCJ0jR9IyuU1ZaqfHl5CyjM8G/V0SN55Cd5h2GjxyEMn0u0kXiDTgc+oj6j4F+9reTE
         kxE6NW8dJB9gaMzqrBAugoFxgWmXGr1vq6J5ELXfnow8OtSoGGMcsNXmtd5EnI4pCzHe
         uSnqnx2gOUq/rz35jx83ty0EZ9VX1y6HTJHqXuWqFhMFVdg74dMAJ9DVRG9GGDbzX4h2
         V6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517644; x=1796122444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5FfCYFUVvUTzjDqnNaw+AZ4sFqwH0Y+i12Z61n6cMo=;
        b=I/BvrIvFuOfryVD4Uu1DkqllfT0wGtQMeI5WOqNNJcdpGG2szot1pRkxmdENWuExjV
         OsttEDkCmkB4mDpkj9qYZs7AenzfIhv3/FHmYQ/80WvrMAbS9IdTvIP4npPahJxPo1Nd
         H+3Dsrm1T11UDm+l63el5O/QtlVvqWgZcsjyDzYV9MQzrj3UMdbEnwOvx0CdjGnHQAie
         qhW4m43107Y7kPh+XiDX+Ee5owPEJxzpvBH3rP49vmuxya8MYRMHheLriSNceWDfHwkI
         FrqGfQB4mZRKpgv2BAzQ++Xp2ldAIKH540udXdNt2aGCoPvTL8AL5g57fBops0+2ckYC
         vB6A==
X-Gm-Message-State: APuU4Z9czveKk1LDJ+IZEKgZzNjzJslCiIr2x7lURL7Mj9JuU8hBg7s/
	StQwUdZwNPJvNKxgX/SimCePmzx/mflwzgTjta3uG7Y5w7kg2Lu9EY+6YQKGMGaIA9N9IfvxSne
	atMppUL8KzP26JlkTAUej0HkbVUgauUEI4fwQVsegi/LlF+RoFWy2D7u9OXq5907kx9wS
X-Gm-Gg: AZFdTZdEwxo6bFT/qpG3c2BbIjepV23ZZ+NCOL3dfEvmP6gn1O7QQmn1G8gcNJTNYMP
	KTLdgfyXIEMUMTUTHUBCRJqalgF4RGsydkmfLIjk+MqNiWg7X1SXl0RZ603A+UEOivAWdbGrgEB
	uV8lcdvkkqTfz/K3d5GDHMYTyEZM+kZE+z+eZFBvyV49zeWJYNyhSdpbe92NM/GnvTm6Nz+/Hd4
	kjGiu1s9kTY7jXWiTWrufitNbZ4+QwNKYEGx4ARdul8mUTZvf8OWyYGBD4On0fg7QH4CEfXyTms
	jjk98spsbjf/CIs1dPmEKaztrd0RDH20jcSdmmqXhHWBJyorhPOp/856i4BKpcjxUhJ2OS10S6m
	7SwwLOwDhDtMNMS2auTmoKLgolI7xeacAkjIWTC17Qk6j/CNFXWEXvuygEf0BBAIP1/YQtgGZMe
	7+CHyYcHKXFkuxCIlzaV/Z1wywCZ2mQudM0VBxMZoDwKHSH5vhZSpgGPLL
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr10681229eec.21.1795517644126;
        Tue, 24 Nov 2026 02:54:04 -0800 (PST)
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr10681194eec.21.1795517643439;
        Tue, 24 Nov 2026 02:54:03 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm19415674eec.18.2026.11.24.02.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:03 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: Add Seca SCM compatible
Date: Tue, 24 Nov 2026 16:23:57 +0530
Message-ID: <80dec38b30da490c8c7a2d0e9c03c9acaae0b8ad.1795517637.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8hcL2PE4JjPY
 zMcExYGG1IjwUTRP72HEc7rJPjBZGoh1WDIGA4kMpvGXqbZDIqiRzlmq+356pHwB1W4FxcelgCG
 GkHn7gwbcGm7JgpuLXfcCtoovvJILuA=
X-Proofpoint-ORIG-GUID: d-ioaZyHnFN18ftFOaFgDEqaea-8gVjI
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056ccc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3HLQe+MboI1m
 2T5gDM1jtw/3fv0JGPKc8/Y8Bua1p467N3UlT8XNG68koheFTfwEPcCER+A/CbmDmZB3tcx7H+i
 g20jj1z9Vb//Xo76aupY4gdEVTdXzIqlYMQVw5ZRUlFOtlIIEIbxsppvbtVLxG0WneyQ8OAXUFa
 V4rjoH/sn9V5koSzjfApuCdR0PiScyKZuWv+Jh5lShkfmn8JdF/qjYN62kp7v6eq3u8wl/ZFAwk
 iICVqfyYRg1kiQgqC/H1fecxdWk9opWSGsOoi5dRXIqvmC0AZThJG0px0yc59r1jtX1vqdW9cgl
 UoXGt+xOZgA60jC6BogH75YTUs0jdzmaD6R8089k+o/37MsugCgXRr+BYkTUdzDEEmidR1eE0/5
 mLMgOiVW5g7/fVRL9AnxKXWl0610YIuI2wEivqeX11yAk7Ti4FhS+uVc9hi4nEpk/Pkmm1GVeQf
 LFuAXZ7ve81RkjByApQ==
X-Proofpoint-GUID: d-ioaZyHnFN18ftFOaFgDEqaea-8gVjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,scm-seca compatible string for the secure channel manager
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..c52ece62c9bb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -70,6 +70,7 @@ properties:
           - qcom,scm-sdx55
           - qcom,scm-sdx65
           - qcom,scm-sdx75
+          - qcom,scm-seca
           - qcom,scm-shikra
           - qcom,scm-sm6115
           - qcom,scm-sm6125

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

