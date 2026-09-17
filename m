Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B594E06FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646106; cv=none; b=WnWJjx4WPdxPteWYADHefz8k7NWskAtTIxUjYpy+EhtiTorNct6LTZjcfwvHq2Oeh3xyuChCoP8/q1Xm7NrPkhMqiIllTu8hk64nvDlR2rmwk3DnVAoZS8O452A841+RjCTnRjIm32d/ruB+80WZtDTkGyYdaWm9oHlu96uWltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646106; c=relaxed/simple;
	bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT9ucF8Wr2rInlcnDNOLamSGh24utsIso9jR6utfZxBUInMFOgqHyBBuGxPF3aETlEYCaQOqvhhVLrhjMYoYfjrt76LCJFPSlvLdA+G7t49Z69Mvi6hBtYOP8Uo3IHUTJ8afUwx0oSD++iwtAGPkxhhyZkaAi9hyZoUjTzBJRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjrDdsTx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USzmKp7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjrDdsTx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USzmKp7O"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZspU4186762
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=; b=TjrDdsTxQdgQ0Fe6
	iF/oApQJbeCesnvfww5DZwnFxYvGmYwT3yMd9GxwBEL2LsBdeL2pY3jP7eJeoWyP
	yZyRTFtRbfcNTuvONto32nENbn9I9OcTQ65BNw1P1neib/hh/pXdt6/lX6E1ThZp
	R0hbxekVaHHJ0eVLpVH6+eJx8V7OuLNO6o9t+W9d+cmvPEpYSH2e5x15nKWU9//e
	BBN962KmWhuOSWkV5fIiIT6f+2lYedlwYNkFZQPWsTJdHVnIP6TdTohgiQKozfXc
	oLuwdCe0zOXFxk6FwpS9WRASyTY8ui2LTiE6c9QQSUxh7FW+uP+f6y314M7nvqFT
	QsTdQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca1qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:54:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso745315a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646097; x=1790250897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=USzmKp7OJhaMbFyrIeNkUgG6ILVSfhIcBR16SI0ie5ZleA634lfnz92dJwEblZqOd0
         Q6HO74+JGwPuj/8bPl8XwD/HlsiI5k8g5v3pW8n+9QORTGN8vojUBdLgiHLObI5tfS6O
         csntcp5vBB79Av42s9qx/FMshwe1btbwfrIeRatrZaxaJ4hMjFmJcPEYtk2htJ+Y42bs
         vljWiFpuXNrbHgpqv9CbwahCTeWxLbD3IB6CDjGvihCQwoZ5oGbmpdwkE9euMM882D/M
         ikgHAV/+JoPl6tF4HmlKIbHnD4qyY1ZnQK5BCX67zYvUr1mjGVG4YuHghPz8Mu4Ccnyg
         7VZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646097; x=1790250897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=J+YygsI7nXa8/kXXrPg8RCukOocIo0VgkxJFTBW46Qq2oodFiCXCsmkXOzUflXxzjD
         9GhBvKKw7W0Xr7WtZtuwbJbXmjw+KwO2zQ1JSLHo7hcYztOeP/VtRsvC+iQj2Q2UwO4W
         ot2sLzyHGKCJ6zHFmrk7hb+X0fl5KAk9vprVHArP02s5bzVCeXqrgEHVur5dQzvIqW6Z
         0D1gvBB1CJ4BC84cBQwPF9C8Jmv62GJ5huoJ+wpYVo3uQSPlgcT8UpH5+cVUXZSJEeAd
         fNXK7ed5qKqEJ8UZacOw2tWIhUHJ+CfgRLHQYt09s4O5DSqTCFFoLXtH8xsHGkqvEZg3
         nAEg==
X-Forwarded-Encrypted: i=1; AKwUvBzhbsRy6yCd7CsJ90kmhEYXQyeqr1v5pGNkuQFCqWoxypZRBSEAzZCYFrlF3eCRXq+UD65VSfgo890VU2F7@vger.kernel.org
X-Gm-Message-State: AFuF++l+RMf5rU8qlzveBebhAwtSj0+y+cUYYpJObzfURIizvacHF574
	/H72qtKU+EbIXcEaX9TtNXH8KJjKfo7Z4zvmuONSa4OvSdtAsaQh/pSb6R4z9UeWJ898Db6e9C2
	6CnTDyhmIfH0xRrJL3rlMLWFH7aakMynEmdRuLvjtj4GqBqJ81dzDZZUgPYBkD/B8x9a+
X-Gm-Gg: AYBFou3/NEdx9NWJVSHRwcRgoYcY2H3FSca964hEs9HHaYjpzYaNa5P6IGP9EvUa8ew
	T0whCPWeyi1uT1QE1iOSqNzLkrBWn8R4IdrOGnIjmc6pMk4TBbUdRwtsQpxhnzoONx4zJGWzogM
	hi/HfnP23DMMzcAt02W4iZvC04U+kctaka8HGri6xgo4fAHXRlu2ZBVwSGHvhFXHMHW/LBSLpER
	4fbENUevuS2MV+zYILamYRSHclghGo2t/YDI2/OISQ++P3InMwpcCp7RlNIW7L8BnfdoVC/l99c
	Mr/3OgvqDtJe32uLTgGFaM92kUl2Vduk7rey/n/HJfty/+GeW4bL1kheyijkyjp8FT0ZC/TkG8R
	ZOBOFNHq+XwVakwefzql73fV3cnUURMQi/A==
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr15880981637.19.1789646096546;
        Thu, 17 Sep 2026 04:54:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr15880923637.19.1789646096135;
        Thu, 17 Sep 2026 04:54:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:13 +0530
Subject: [PATCH v2 05/18] arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-5-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
 b=mdyAI+9wdGhhqa9FSeWfBG0ZLp9n3A7owGqgcmyDh7SDZ3NkSNWvZivPLcKCBU7veSsG2PDql
 do5xxHjz4MxDkUKx6hIvdrhB75srv0wuL5ZcdQ6u56ll6z84pkWad7E
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX1Q/7Pp28/zYM
 LNx0dmlJ01ev0zW4BGM4g7FTLLA8VwHlDbU6Ynb5EcGjlOjbd9qGlgJXTu0mKF7ZXwBMkjF68ve
 r9ZEzJd6b5mOz4K8y21QPCtudGAnTPD4bT4kZv0FXa/up0hqDxgadrnUNJ1qbv3SrZqV3QAspJr
 zsYsljUxD4DNWpGm1i2VyZgJJqBNlXwRNmMpDPTUQGIg00GAEqxYg25MDu+y6C2/K/Sfm6P9YF+
 23AA2sPvmCZhTIywGDAoX3qsHc9iytdhjg12bRDaz9sf4foP4cxRbDB2lsWktkJbFyJ6bXGK4RI
 PoogVVFzJlj4GYKbwEvYPvPXK9Qz3M345W3XjWSNHovmJdoEwjW16OPNAY7PfJS/pzhv5XJ87qm
 uBSsQZUrOP3UYx5uEYyQ7ecVUlo7jfZ6J5D7DkieReeDpZ3BISUsyA+A7n54g76GFNtZMVop1p1
 btqRvQVKKNQ02CetWyw==
X-Proofpoint-GUID: EpIxub1eT1GD6j0ltwXXjq0Ve-m1lQqr
X-Proofpoint-ORIG-GUID: EpIxub1eT1GD6j0ltwXXjq0Ve-m1lQqr
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabd512 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXyYCd4uekt/Hy
 e+Koa/KquMvcUgiaPbEWxBM6sWQfgrFQPAcOqxZhj9lK3Ec3lNRWeY1rM0kKPinEsG7P1J1Es/9
 BdBnUjZ1F+gyc0Ull58oUujv35LBPGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..74df5cd86f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

