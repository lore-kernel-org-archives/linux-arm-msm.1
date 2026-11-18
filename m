Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996312;
	b=sEMRJbeGDIy3lHRADrYUgM85QFawjDirdBussmPCwTuXP4wvkRgY/W7seIhkBVFZZKuR
	 zNRBvIU2E66CcysLHa5k3b/AlH87toUuuwvlOxFX2CJU48s55EbUDuaRRWY7mMC85W9vQ
	 kRjDZO2oJn5V5WRU5z09sqhJe2Y17Lg/cjW3FFVZqrydQLh3FH/fd0vb2pIQK2vv98Ual
	 V9WkavqR9Fax7MViPnERVgAtm4SJX939UDpdwseekxTAHWDAdp3ibJftiH7Re6Z8dO7N8
	 VzxBk9+LmO9+EH7eLS+p+zh58HXDpEPf00vGJAPF4SJDxD7SLAtHpr5EnNaQrc66Vtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
	b=P4+D9UZN77hvkD30yN+r+GTCEHN1ReSSvmJ0KU3hzt8bhQfi9nNvlyEbv8MCfbs4B900
	 QnXjpT7P6jKBQVz2g92LMEU2X+NdP/fENsHPUKmpNTInKmqF9nBVCQgDbqaZmt048jz5O
	 LORQIXM3GBqyU9xd3Z1ISlVmXrPaiL2OWRHThPhcsltt5321HHomuewqi3jiLtm7fv0qu
	 T7d7bWjXjzzrfeCB4QGSOtnMkBUQnAcDcffbRVwsX02wcTCQLlWM8TjmSqwAGATF6lXiZ
	 bAnDBAGEtvcHsTbEAU6FRoOK4yluxBlwHOursP1R55+UgCTytATpyY3AUARVl5glkfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppvdOeZ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZpr6Le;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861C606A890
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5861C606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppvdOeZ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZpr6Le
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kLYx4082593
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=; b=ppvdOeZ+gCtRvLlk
	VV/g+v5DCnJRgRrxbeeNfU7S3+9iFl6kU3+wxns0bNJ/MOhtz8uo4mLMUTQgLXJs
	vo9avHIUZNc9nzpXu0l33euzcNIUxuIBC3S77BDVcdJCFM5LuCkPSIYpBWFvPPuv
	DKDC8JJ/WvdZnwqbMKMO0+DWux1qmq3Koi1Tlb4nwkKCumbfzjRDYjwnde/EzO6k
	ygziY5McD8zjtQiT8xq5b5e7a0Y8+ev6iz3qaXRxI9XLVWUVSIVpJdlq5Cz0pHsA
	L7WwKfInupQqdtwcsiIFYJxJb50B8nn372IuT55/ZznJsa7UV66wfWWeB+esQ+VS
	V2rf9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jdrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:05:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so166239185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794996311; x=1795601111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=WkZpr6LeobE4pYC4O+g8n4PjtNDhiMC237lId/zjyFMJiIfod3uLLYKR5qT7zvfBgs
         bz9ghll844nv4M2JUx+x6Oer8NXbfvEAGuORY+84JXmVk9/0DUszdkJr+AEtJIYDvW3D
         iD9KhuYSX0acBS8n27LvfKXARQcXhQdYBUJ8gu99zpzzBdlC+WILIl9giOwM3ojRxERY
         Rv/w6XcUD2dlBe0YRSnL+6tf4YSQBzrtwqZGJuUDm70s3Jh8dpiAEk82GOY1EEHVvFr2
         fjcXUgQBmt1F4ykUSUIvTNUd8v2nXluizqllFOoK/vtYY74ROAZyPl6YisO42x6QqcFw
         j/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996311; x=1795601111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=UqQkX/CUH/IDzlQMaBw07ef/AjQxeHKVxSFTMCSyc26t0u1hVlu9XdKjPokMxj1tNg
         EMdax7dsRztCusB3jYdIO26J99v8Cz30oxrIbcuJOJMTzJk6GQCIUSGA6SU7yxfYDnyE
         KWPxl9L25WGS3irQcTE2nFYLfGuth9WqpGyy32dt5gjuG7vLy72Vf3A6wu+gcI6ye+19
         SAqZFcsn7+yqTY9Okbkafkix1MMhc7lcvp9LNOXKeFvnhQi0IznA3EB5/79dZbavzwCT
         HgoMcV8g0QslTxxk/h6yHBi8YHLLoTC4P6e2C39lbEGLWL7QTB9PHKoYdAcVs8mqhQp0
         MY0g==
X-Gm-Message-State: APuU4Z/q1PeF+JkF2F3/Wk0Qh2bCx3q2nLfsE21+yjQRt0uTerziWke8
	8aRwv7vtKxCv7466XP1JN/NB4T4zBMUD2kT/mK9ec9pzU5RKxFpoGSSZt3TJxZTjw8A/vyPavhL
	8/ZpUQrKZfbzxmme8BWs9FjGYaSayoAeFDsJSS9aPr3y75hdF7FFe45dR+CgYbRh2ou3e
X-Gm-Gg: AYBFou2jpjp6xdsy4TTxQGBZlOBQ/jg1HTxmGuIOfnkNwXtbUaLvmngsQqB1cBrA/tE
	A1rcvwoxemF8Rk5ooGQmS/n71YDzrzFU714y4OqxwaGeVZsWIRH2VXJvdDyIn9K+mcEAio9EGSh
	XUwvJc+pZfqE/kOsq/LE7D5v1Ov0U47Ua4ZfWnqhz0iQm5OATMrDsHtWi49uOVj3r4Bk5CikYYT
	A+/NY9Q+7L2vggrdXgMjd4eIQXlW5Uf8DNB8IkKQUmeAW9mNDkJZCBPJMY0abcNCxU7/9JiUnAr
	SEP0RtuuJNHVyc9gedQjEi1S3keNXy08V0ckR3BWMfa74DdMZY7Fz2qOUZGJDJdi5Iz0/Sm1XZj
	FdXsh+xamRw7y9HRY5K1GVUnZW8aMzecjGIuAwmwmc/shdfhJbWtGkNxSt++S+yk8qDeKSpZ7xK
	8=
X-Received: by 2002:a05:620a:28d0:b0:949:6668:a8d8 with SMTP id af79cd13be357-9499961da5amr395485185a.66.1794996310537;
        Wed, 18 Nov 2026 02:05:10 -0800 (PST)
X-Received: by 2002:a05:620a:28d0:b0:949:6668:a8d8 with SMTP id af79cd13be357-9499961da5amr395480685a.66.1794996310050;
        Wed, 18 Nov 2026 02:05:10 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm3735509f8f.37.2026.11.18.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:05:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:05:02 +0100
Subject: [PATCH v3 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261118-sa8255p-emac-dts-v3-1-e2c365d95a0b@oss.qualcomm.com>
References: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
In-Reply-To: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5XFVjff/QR80SQLKKFqKe3LuP6yj+0SGfsOuiR06Wa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/XhQA8eVIX3pTCurixAQxn815mh0VWbVJxt0R
 tcTRdf7qB6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav14UAAKCRAFnS7L/zaE
 w6zbD/9R2S+lyODnntE76ycbxB2bBSAhOzu8OC13RaurkdWxQns8YigP8q5HkjUeSiBjKiFENLE
 iNqwva+UxVy2eu2111uP7al/m88t3RBM9/batM9gawlaDHtXl0AXV4oBdRu3TG+NNtGtNcdsL42
 MzMl1yiq4tWebBTO3ErwBgdyeV+eKRW0bBUVuRx6LihNJmt4cFeJp8L1IXUneKXqolmbbFFLSwr
 DXvIpYjWQUhpXlQXXzfgR1p6RGGVtNvWdy5+HpYKXYQO3w/LkUFCmSn8gge6CE51c8+hgANm33g
 gqdHkB6q7RMWuM9ZAUSYAN9qCVq2qbMdy01OzUVIX+gRhufpWwHHmthcv//gs2bIHGrWZ4JIlcL
 6SIn9fy1m/yuA9eUcSd1WWLjPFewhtMEnIM8rG6thulf+EPYBKrMzjWunNXoo5RfvJ8HsizfLUg
 qjq6biwthhF2nhimxhKwMhlQRrVgIcWFAWhoH3K6gTeGUjT66IlYZ4Tx+tljnh8+H5qWB99jp5u
 hQe/GNgTMsY7NYjcd5zr2TToVp0OwLZ58vtLKWjV0eFxpFX6mPeqMwDwO5Sd/Bwc0zqdtlDWdKj
 a91QmMs+6Ri70eG8qMF31wzSHxBHRH5vvXWd4vqQKTT0kB7JrSyexUWDdFBILINxEhY51Kaywol
 wPJgZlj8OsKs6mQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kFOwXhKBeydMwQx8cneNgioYD_FIUWA0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX/cj2dZ6M+k5o
 ddUUnEboVCkd0LNYguAc9EDiNocQ7R7gHQIe1umuhtfjd16rfGcQyt3klKj2mgxuV97OVyUzeCn
 NaiAgeGCcCrlhk09SNehi2Ms9btJUv4=
X-Proofpoint-ORIG-GUID: kFOwXhKBeydMwQx8cneNgioYD_FIUWA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX56Zd+Pa8NJwx
 K80EYtqlPdeCsCtUs68IVcVwLwxJjd0LEuff4rz+VOtfC/l0GDvcUG0vXTQNwz/OM2dKguSwMeX
 CSvv3eDfTpVrSM90ZbSVpagx/pSmBoyOG+7TXPDM8JEth7V1ufCI/0f8jIYRK669e/l1aeQWDkz
 URgGcdfIC285+pgaZfZhNheEWfNo1vbU592c0QL88pjRD8lD9++Y8U5EFA8ScD/u0j1DkaZvYEK
 dFnfy8PzL9rEhSO65vlXJFwk2DuOr6M6sEc9UT51ubvFAcPVMvBV7ZUakkE4+EaBati87GYjcQb
 H6M9OGaE33L8ehTrI8KGshWY8ubHeo/2eO3x+wzu/AF9om19nIyiahOjZDcNEXqHcHYhu3Zv5aY
 Fx62vcU5nUnrob2BFhlygSp/lqgByPVMV+zG0kjr0TJFGU3rfGHNLUJFdP1oT3eDVMVS50iajOf
 5uZK/GzSR0jyi8mjIow==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd7857 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..4e1755a7f2cdce07c454329760cf9a1a2b6b3977 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4401,7 +4401,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4422,7 +4422,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

