Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720524;
	b=guLRSoYyr+Nc1pXXY5QhcxQaJJGC+ZcDg4M8YxcH2vaR/1DjsyOQfdt5pTVUw2xrp0ol
	 Mjj+7itcKjl39GOQcfBTDQ+bwkpeAJhiWhaX0/05GUJnDv1Dgx1GzIb6QQzRAaIkmKShB
	 Ll2ZYhVqmKAXNBgzSQ966AbwW76Zph4MYb8yG8eiZYXcWSMm94cRzQqMlZvtDcVHPsTQL
	 EIXbM4mxXNr/JM1zkNOPVO/P3lllvGgcSEr+yrcll3s4gWSfwtV5WdoMHR5xMXJga1N9f
	 soFw7NeJp6J4eHlQi3bIVca9ttkrsr/nYqsdqz1SSMJYsrl4BKhryZTvtO8mJ0qz09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
	b=XLFBDbvea36gtBHR3OOh8tw9s1LQp6xJc0KhbUrVgwzM7tfD3xpSTjchk4L+yjcylvQH
	 IewnQTK69QlNi7R5M3gWeH7bfJFu8cmedPoykrU0Pjumhj8xWIF5Hw09s9Q5kVbJh5BKp
	 +/ib5YC9cM1vajHwx7wae1tZNZW8C1S8BNH/jU+4oUmnIFmxu08b7QPK0Fyys017RgnPB
	 gozPW3r28CL5Ri7UjWYrBhGr5rm7dcINa+ZBlCxrFcEm0MaLZNNq+0nd2rxXc6golNB8O
	 lRGcck15zNA2Ka/kax53iQCITEE6iVM1PtULlnI1MUmO5FA0LuI8HmuvYdsA39qJ4eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C2A606EE87
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 15:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C2A606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9tS44104156
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 15:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=; b=TYWtzdo5m+Wkafbd
	r7iRuI11kwmGXIeLRy0fD/CRCOkdOVI7KXngxO1AufAbA/yR+zURtnu8KW+bjNoY
	iblGYKm2zIlYWuochRQ0COJO7Yg14pJOgUu/9Y8GkwCGhnYMZj/N6oeeAIT9M3ki
	dLIgqZyL/mp0wNmvqd7z9bed/02qj0/7RXSWNnN7hdQT9sEGF3jD+QwKWSqAoDJ2
	WiEMmIQrWzp/LHrPoCKgs2Yu0KP5J99ULsPvPjDKDhr1PpLnXtXqn8h0YAD1IRhH
	bDQllzgTaPbxv5sdqTKHKPun7gOlokyVtg4FagsaL/9bo2WCYqyFd0SGsAO5fnL9
	51POXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76daw1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:42:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9371253eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720523; x=1794325323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=j7JwNDxXNF+NQK7scVnvtXde63D/5vGblM5TQMjgp9EpLEIJtcGFXK+9xROQE6A638
         4gF/ubXHQNF02K6z4jS3EBgMiOYHFlNf+1T6uSp1tKNeZI7gGQnQHvE4mNrMGJBCmlt4
         ld/snuYlbQsZXzRDOKl6Nd/8NjNMOKL36kHf/PSavLR3P9s9XMaKDf3+S4oPoH+Eq95h
         T5eMDq6W47gVgaqoNPq7ntK7v7xBikxbDvrt0oDV2MQQFHHnh5LAdrhWNJLLV6BNL1Sb
         MznKZRW5Bm8Kn0TUVkioeXeZt6s3pGSlX6g93Z842aC0H62c0Y/5ZiZCFO0oWyut1KU0
         g1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720523; x=1794325323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=ZYhZDEbKnukhWp2oC9JfibCAhsJWtFaXocKS+wi2Vh3DnzxmzsaHKJ4WVX797U12/Z
         ZhRPw5kTxk0gJNXSmFD4g+u+Amr8coiRxhCAn6FJvaLXpmGf/3KZynTl70KRA7NB7q4+
         qsknScoq6WeRaXx0JlXvBfpfYdZcPAa3tR/XrQfQP9awe5AU+wGhc52jO/6qfcR3PvTL
         1WJHiYmbebA+sg2AvTbK5PbEYbwPTIIfBENOHZ+AATKpv7Ep/y8upJE20Vo9ow7oOZDJ
         qs/hbZcz+H69eO6tthAKVT7+mhZDQF4JLQSwbEEyNo8rJXEIyqT9Pyy3EX67eWEQUSXh
         JZDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLqI7XFWpDRmE2td6B2bbTGxjwhKnwBC7WjTdOh9PeSx+TATGsIC/dX98dUr/cIGCYH4kuoP88cHRhfAlN@vger.kernel.org
X-Gm-Message-State: APuU4Z8pnny+oktN0dPVbPP2STK9l9eCImMXKKzf07mkBKCqLe6IGNHn
	9ZNpLNzJ2iRPZJ2eFYQ3WiqtJF3BQavUPRWBGRak3eeg2p8vx/sbyyWKawgk3u5eGf8Br6IVCGy
	rjyC2Se8dfKYDIQXWRp/+sLYjP4y35LepHJQmne25kKnpKFfpE6nepX3moRXn9trQABmC
X-Gm-Gg: AYBFou06WOhMiOt6kSM6QyzIFYsKeIUnNc1y7gZoLrwqo8IOC0dZOux4ZDbX9Va4KzO
	PgZlYYiouZahT0FrlCxZWvTN8+nY2juS3P3dOv4C9Zd0DcpAc4YhH+YKVsSsDUR38Or9HpgS8qW
	EJCOB4gbzGstyW+0L4oc7D+vIs3V3hna52Y6T84+guvCJCsAKphBXiAZtdTKfe2E+ISlbpP5LCJ
	cbk2BoJ3YMbDoFsif9WLTWS42bvDVB7WoVNzsrhWrLoMBvqci56tmpMQVNofu6JY2aA35V9t3DE
	mQWf2YFK6/jLVxfhtuxAr3dK2DYceFE/wynMSoe5kgr+vsywv+IYYenGLOdISKL6I4GcaBTJFwv
	rUOVf/w7Zs9yfuiMh72a4IcdMDwMp1o52lRnbDye6nbwLwGAtnTUm7gmAhCuNNHCGQHkY61VOky
	7aPA5K/XHM
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968989c88.26.1793720522891;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968954c88.26.1793720522366;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:39 +0530
Subject: [PATCH v6 08/12] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-8-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3423;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=TvEDrATTFZXUolN4JLbo1FGUxxzhhCTU57S+Iqt+3XY=;
 b=muFvx6SokZrG9kmmwt+swXlq6Pep9sBfIm6Gi1ogj72KnIwO+GykcNHOcHvSEVqOAMjXT4aoX
 5Uicd+B20epCY24mY45OXKuoyScn5B5KHddSxmm1oTUiusm1jt5oCAk
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6aea00cb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX10/LSgY3ms6j
 61TRE+2q6gyIC/ymS6h0+b4l84gpC/Yf4kdABHorJCsWfKcrvbYGgKoxLgttVmqeXEE+KHArvg2
 M6e3GPnmFHrth04xDQLry50aehNnplE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXxdEizn3aY4pE
 ypqqVGnPPAST7hK4hcw3pKajQXoIm/mH8+Bef5FFDJHBOqp0VyOv9U+4rmU4cqzf9mk4O4l93QL
 AJ5QbdEAQHXOx78IuUxyYVurheIS43l3qFplor/qFLlPYPGEFD+4ONLOK82Vv00k9ijfp1eTsiL
 2x7u/U0h+W4ITZMhP2Yg66qB6jYFjZQiWCUdfrxoqzEfwNK5cdcuGSLjZ9YF3Oyv4g3tfL64GxO
 sYV1/6DNS5kpjPZW2EHgR5gcUEOH90BNxEvXFda441F7anuQ3YQXW1G8JnWA9uZu5LVjPdW2hk4
 fIoRRPHet7Dy463bDtS4sJ1Zf1bRGCIyr3hO+jyfPi3yybz0W0ZgASnMo3ouDBCCMMpaqaMQSU6
 D1oqtrnJc8jLo/OEHBmEvmbYqrRSt7R+E7pCFnddZ0I6XrNn/USh7+r+enlJXfdDNGIyPNuVisM
 k3hm2r2eZRuKaOQhL/A==
X-Proofpoint-GUID: os9T1Pe24TiK0-4nReWBn0uJg5odJd16
X-Proofpoint-ORIG-GUID: os9T1Pe24TiK0-4nReWBn0uJg5odJd16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03f6d40edea71821bd763ade144707bf8971b65b..f98f1c705fb3380f1d5f94ade217c0c0538ead0f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3707,8 +3707,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3718,6 +3716,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

