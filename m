Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688498;
	b=oXz4jQv192u2tfWIQBDz8kGS5NiIzYK+A4pYowL4l6TMuAZY9xUN5V8SBdQf7UVSn502
	 NYOcR1Ofisbx3ltlZtOII6Ov2b+7Y7/UUtLzNfES08zGq0L+1R7pLu4gWLUHT32Uzddqo
	 tfXnR4LfsN/HkMdb9RjS+RToBB1qgrtIZ4f7YMd/3sf8xAjQqIxg0USbATBSL9joRL+sl
	 n/RAgzXZzEP59DCxXnJOYcHp6cOI0gdfJcpY8x1yBMq8wRx1wJBebybo8cWsqPu1wgTG6
	 0xY8hhbpKFBaJJ+oNdCA9jmvwNp3NHkpq5MiZVPWlih1EW/0xbwzm3BOp6S7OOBe/ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
	b=THhBsSSUgShHx7LcTBXCSaxWd+WskEwKij4TshZk3wjqPLV+y0RWiil1JueIusfrFM5z
	 dpqxTmGJJCWwxVFBr1GKi8XtZeSY+uw0HWTYxWtE1HHlqxmPEU3KiLhAVXRF9RxLuIS+a
	 RGW17hFD4175G1FLtM/XarLAjurJWvpfTM5UQS6oMXtQZJmvlpbFYpXk/Cn9ab9WG7yJM
	 FUDdNYmS7NHvRmhrQfJ6pR353FnAkhe5DauEl1p1iwyWah1NZ3wATCdYVzQbsv8mfmYhI
	 8YF3+zF0gIKxGL41t6E7hOQisxgfm5Jvg0h25yFlL2rvw0rB4woyJAdk85vZ3Ws7+PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtKophfD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Ui7lw3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CEE606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtKophfD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Ui7lw3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwNw2175589
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=; b=MtKophfD/5Z3lMMU
	r8YJ9EnDaDBPeuhGUDvY4hAmeFJ8m71b3qLt2Ji047XP1j8t8ev+0Tlpnl6pOD7W
	Fen2nhNwtYJpxS6hSQFp4MbdqjMz4C5phrpETqUB5+z4WNeJbau5DlOeQnoycfa7
	onF+eGonEOh7zaietG49+3WK5R89Xoh0E1bJ3YKWlGpeU+2YT7HrTwMWtLqiLYHX
	GksMy2G+9Nx3yNNI1ZDgPFwlR1aPhJQzy6VdnBdoUklghmYxv+ocn4MufJQPLBmH
	9bD84buRfIqT0wVswv2o4LY/diZR6DtpMCR37EbMMxa+niuM60KX3U8sS+CJFa6Z
	ne7G8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuywr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso1255592285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688497; x=1796293297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=J2Ui7lw3iwxOELnr/3FqRghwlN7R9LnNHNEL7Lbs7W4e2Go/GWMwM5vZc6EoxHngH6
         v4qQ2KorucLxpQPzCgxN/nqWDdua34PPSziAa42ZWAUicjfYGgPxV6uxUHHkpJMxv/cn
         3N1K+9KM+CtJNzC03MML6Bvp4GOCShSgrN5M2yjL4NXWQhsIICYNX9+1Eys4PiIRu3dl
         x9Q2yJYP6AYRSjR9Ngq8pPc5IL3nqrABAVPzcdwas68H+YN4ViEE/qeFBckebhp7omPC
         2uPvaPWLhgw6i5gAiBqHvFnNRWoYl0WhOUOOdhIC3wRBcVMLgp2FjH0kvOJT7AFUms6U
         B6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688497; x=1796293297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=sqbk6On9P1zwAg5z25EAPmE9xyH+YaOyp+606iYD7LT/YAcj4YcWwRnanUUNTviNnG
         qH6JxtkPYRuPbInIVPEP9fzItappW9TAjDh7aEjKS06gIYkpomS5AvLRxs62lPE+HzAD
         p3K//6E7UHVRXZSACyo4q5JOo3wv6mF7lCWAxgbFSx3cU9gBtgJdkdZhPu+pZZoInO4k
         X0msIFB8ti1nQxWxL1sZunRLuWwAWQbrCTWtwim+RfOHJDLnIFot5kem1lKTuInBBAZ+
         0Uv2nUR4itutn6gmX4CtWwI/Yo6g/lyAkoPdSwIDDgQeX0l930G5icYLonWFquCIpIbc
         TnmQ==
X-Gm-Message-State: APuU4Z+O8lPzjPcsZRfgQsWgJEmiShVsuK9V6zxZB+YFJqLYN1v2aw1b
	T2rggRRHCJuiaCLWyd1AzOG1URZXU8w7ROPVEbah+ebnKHZ/sfmqXyvptAjRjX2yM/bIzKB7b/7
	e+9aNpMlnCfEKqzDElJNHd3crHdVxQQcEYbKpCssmHmDX65DcrtwjuOesAXas69nHx9x3
X-Gm-Gg: AZFdTZdY4WSZ58EsisnDodiaN6ibhjPKfa/BALbiMe3s+kL5dXkShd1OcEaoiy85/66
	1FdkutHmAbrv1AUhIX0bOKkJnybKEHdLFP2qCtr7mIcQAKTBedXFVloe90jcU7vnAjryE3JPsx6
	AV4qD/AfkULNcRRGFsnjYmf64kvVyycikXxWMUnkaDmmbqShq7RGIbKLIQ8JFipezoB4jXcIFII
	y7xe4jVicDstqdB0AGnPnn9z+c/UMG8s2s+aoCxYx4Hjq9jHb2bZWBh2IKHBJXNxxxf/qHRXIh0
	RT4ACdeL1qRdb5QWDCLB4kSm/lRe/QlHr4Bv651XB45f69FpJ2+WWgNfplbvnSXhyTro4znjmfo
	eQcDiBo3PuCuyzIfNR42xbpZUogsIRuHXOE9hcv+YbNJwUxA5hkjGTjW795UWlHGVExqBy4NEQK
	L6Wnf8tdIGcpPZmAt63l6df+t3xpVxTZw0+Qr950838buhWkP0eabOY6KwxHdRPBE=
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr2114312485a.41.1795688496710;
        Thu, 26 Nov 2026 02:21:36 -0800 (PST)
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr2114310285a.41.1795688496267;
        Thu, 26 Nov 2026 02:21:36 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:14 +0100
Subject: [PATCH v2 10/11] dt-bindings: pinctrl: qcom,sm8550-tlmm: add the
 egpio function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-10-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/dsb1sgncorSisEr/533isCV/S/Q67kIN+W0RZxWI0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUAfXCXUk9JKWIX+PPxot4wrr3TyLnqq2gp
 3c2iCK1XrmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w8JqD/4tlVYPJ2epuNXfctx2OeLhA+8n/0hN8gk7xHPrYnmErai47qkAOv21DFbkngCalRfgWfn
 MP26F86xxYngJtDUn7yHwUjWko6h2RqACiFdTKkLbLVHKfPp4z3anfhsgp0bADlFPUIhK0OSY0a
 KLyMZwFaHjqX+p0FBSSRDw/e2bFZYjrf43IH6k+RLN0pDOJa6IwN/Z5e3IYVIn+JaJiDYOsF2Ab
 6aYbgKPRg8vevcyy/C2E3PcaR7/CDUvZ0rCXAgrMFIYa63WV1DZIbaOhQLJB2V6cJoM9WrW4tFF
 6gQrXnwjZ+svOPKEE0pHhJrogMIRA5GGoJkqdZyEtWSp2KHxm0OnJTS2/ro4GsvfV+p+27iRR7m
 AnMU1H7koEhXCKdBbMYdV3tbBVoKVpsVEkUcyTRsIHg+93pWGz85FTZ1M38thHGhC4FiOW/Ckgh
 hSInK755Av0mGIj7s5+29omNXJlvBE1IVwU+M3O3c4Tq3/+iD9nDg1XZH2NGDrDzFFRIOvzBgoq
 RDffSRDvGzcTlkzanN016NtNscNC/aTlrXKcsEIH0iBGc6qTeaias9XT6lq0SvutWaCf8k782MC
 Sdwvs/TdpD/mLRTlCg3woOY/u1mW/6HJgrn9pO/f5St6mN9Eng2CnyWTHGq96wqnjJxAFvYF9sc
 6TYc9sTD7/JBtKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: RBRgaVF5kgKMmvGeor78c7DvtobCxxLQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwG7AOdiyQWOI
 4QjXipxShYRpoeeJePtTkx7xPWcf1zMAhe5YJKigYXZq2WU660GB3D1p71cQWtHvysq/SmyXUw+
 QFJf1IWn388bpKZIJZlSndgJ5BKFeEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwS5a26bhNjs4
 zQjtG9+Hmc+DwFnknuaDP1sR9APBcCTcKln/wOvt9OzKh9CBTvOoBWKNnaKqYb9U54syZu9s/gO
 EV2/Fs8Xa1p8mZ2ysxMIJCemqHhrWOS2EQEUx2//vt3+4qT52tFWdIS67s8iTcymEjCgtj1n8iX
 clp+yTerW57ft/x+heqCGcO9fhA9CGK0v3dt6jhxxGH1D6MIKzMJXqGnvFiYiAelGZNx3zvNsbv
 cpRjFyI1eOp90kcDUmYMaCX37anEQHgV6/rKF8CpLfOLHl1fniEhPLyXxfNBSdKIzhKTZnmxJPV
 pwAqbC6x/HpF2omu9dOVDponTgEp9Lv1giXHojyON9QgHlQa5uBMHXpPYKp/s5fADZdLEmWVnrf
 Wq4y7tXWjhjUlBCNoGAUzmmGdRyPK4YV+1yZke4ETjPfOEJLjcd+CnJIS/3kNNVIEF1LVETyOb8
 yzdlGgOKBUjOeTGr5uA==
X-Proofpoint-ORIG-GUID: RBRgaVF5kgKMmvGeor78c7DvtobCxxLQ
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080831 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nBsi83mCGTvHtYwPD4MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

GPIO 120 and GPIOs 165-209 on sm8550 can be handed over to the LPASS or
SSC island using the egpio function. Add it to the binding.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
index c2ae79df424fda1be7f8be2b2c3d304df9040c60..8c0c677d7fd7f51de62d4cacfbd429789e04878d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
@@ -74,7 +74,7 @@ $defs:
                 cri_trng, dbg_out_clk, ddr_bist_complete,
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
                 ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot,
-                gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
                 i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4,
                 i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck,

-- 
2.47.3

