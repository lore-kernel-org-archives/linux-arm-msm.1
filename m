Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172901;
	b=n5P3VcDZR13FCh+qEDgMIQ4cVucoKf5652RKAojotvAjFYGd7IWvtiq4uY1OjfIEsb6p
	 ka88OgjmT/9xKcRbWliNWynhXK8RYIl1L88ts1Y0+PjKDwKkkCOXjnciLEaguJ8DwWse/
	 YVr/pBq9dvNmLMxsrEywS99MCUCgX0RM6LUnPzO/iWUmr8CVt/7TgU2j2lfVKVP6qVOcH
	 6rH2jlydNebOKjPa7UPVi6DjykXddPotqDcwSo/Adtgbh4eUs/+is7vFKODkce8YwQ16U
	 elqb6CbHyY+aXfTA90odSYY6+FHl0a9xY6vsi0aiphW0RTxD56B9ps7mLXmhaMZHwBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
	b=gd9k/NiV91mVWVaeahuE4ervUhz/3wV5k21HEawkIAfo8o05A3GvhsE6r47C+22oBBtl
	 8GCklivP0lC7ya9oGelJbYwI/ITJmRH3kuGhrcp3GGvliRbOkdTy0+4Lk+6ZARTN0O5aZ
	 q6xKndUncuwam8+vitRPrrOE8Pn/v25dDNlesJiUwPUEZHUfH0V0+BFQFyi8ZPymXx/LB
	 lDfZoAp03nLkgEDOc8HiLQX/+hiHmZXCCXrKNhQ1dc3tSJFFaBu/JNv4JB4IwBBeB0X9u
	 0C5T9Tnpdbrlpwo/XiRC+kUsO+J6m7HevbSHNx/4s89dYG1eGLoV5VopzBlEBxHydCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/SiqKVW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EKsbm/Ui";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF0160A5BE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF0160A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/SiqKVW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKsbm/Ui
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwMp1060481
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=M/SiqKVWCsBLXFmb
	l4zFOxr6T0VDM1R0F+KY4JepcSgMLlrunAvyOA1fzp/XEWO7bLUuvqRXrTDEmoVq
	jBWyM8s1t+5jghX0GC39ia2TqFJfyL9n0ST8zoe8f4C9D36bQvXt0YTyce0MRxWG
	fyClqlnYwed2v/YMdcUzPm3wM/+8ThTvA/ADNR7zlU93ZEkEDb/KfKFX74JULDVi
	eKjCR9XFi/XlO9BbRzQMqNIgyoTolQzIGV2HpBiliH0dyskfcqWzc9a0ie3rg3hw
	xKedYlmST1zQ+mDvDOz8ny54ZYvAnJw9oYgCQtuFJ4V6NQtWDp+SGXiN0LERCwDU
	BXcqxA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso848680eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172899; x=1795777699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=EKsbm/Ui293vLEA3NBPMfLRlifGYParMRHZHrGI3PFMe6y8NaVbmMs/KNJeVgSmdFZ
         2idARqmLUhb+49iI7JLdnnlf4qqgSGyfFPRVGSq+7bPS6f29lHM6xe3CDgx5FMfy16TK
         uSjD1N1d0ddqK9ICv/Teh6AqhrbJseTL6c36OKhm7tyBSQCzadM4UmqAqLU897zDPYnO
         b9mClnydsTc0EjSG0I5wY2PY6npuZocQ1RwHfnJzl626t5bHzVzlfBsfcHgWwiLuZYfr
         HNgQh7V+QGIX/wWySDKWgREnA6siQ6ja2LZ9kgMgPjiqapxo/OiqhxKFELLbxcy1oo5o
         Um/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172899; x=1795777699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=ZYUMbbUo9gIsteNt3gzc2VFQ+Hz5JeitlC+ofLnREBlDqws2OwSuLUmHel0dfn4N16
         stX2/uxovDRUfnxjO7loUBjYO/R0vIcQ/cIf0TKrfw7EvsGIU93CEcAB1XTnPI0ALF0h
         AQpvrOKTfoVmtPFRMDT8UXJl6QfSvNL7UpQ2GLaIWVgTxk9Lts7G6+yuzpn6k9tpVcmg
         Zc75EH3G/Sszyn9ZzBAkUvL7LUKAYvBI//qoSdanUhPO/BHO6/pmBxU1XJVg/can2oiu
         mpEBo1D1wectNQe6oDaK0OT/yilTiLeYlgrwhD2UzcBLX6/HDJR6zL98Oy32JV0tUQbn
         uklw==
X-Forwarded-Encrypted: i=1; AL+hErEaWsbf2EyIr4kw2eyusIcsXCgYP2GBh9SrDDGOIHK0z5LATJdcGF/kAGDsZrbrsFg1uccjdFU+J8SRXc+0@vger.kernel.org
X-Gm-Message-State: APuU4Z+f8RAG5PBFYh2PWI186Lc2HFaSpnLUN/nmdFm2EjZ6EEkwY/kx
	pVLpO+eM/nmyEb3+YH9snGTxeF1GG6atSGbHuEOYF3hf3w+xogVvKaOigmgxVDfrixzaJJzOokY
	/7ZRX526Kh5u7ZImi9IGxPdxiXzaTUcfNIT6fvOZb1qhxe0e4Ac4VWM2PgbBLv42o8F7P
X-Gm-Gg: AZFdTZeF6GoHw6zGSUxo0Nrt4qdiO+KIZZu3tKZ9p7lipt2grQBZSTdpwPioc78uH2C
	wUvu1Ss/9ehq/bgixJ3q2KSezVa0dEtIzv6Kah93Dxl7DrHz5OLclmLfGDgqAjGH/THkQi7LPQT
	EfvvgfSBCe7oTrYhXun8xaVhAdYrA/6hPMqeQQ+rUxg6HqTFUMlp7snZ6VbE7uR4bkjGGn/3Z8x
	xT1ebpg1yx1QAEBC5vE3+wU2llaxUxf87IIdjIPvWH+jtDy+1TXafG8cmW3SJhXa+2/2SYX7t0C
	axsHbIqjm9cnSmXYUKgTQKCcxhUF0aZMt5o3oCFQAToNEb1nnsVtDeX0X3eP5udgaBwWAGycEBu
	7vvnwAB6rc7d9IapkcbngY/uI/TFDFsiQgMloMZxyLJPoy6KyHjY4OuMQz0OzQ8NtpeC3GBiMfp
	H41LGj
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814534eec.9.1795172898627;
        Fri, 20 Nov 2026 03:08:18 -0800 (PST)
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814485eec.9.1795172897871;
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:58 +0530
Subject: [PATCH v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-17-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=VRQkE9FAhJjTHlJP+APs4NQ+u4MYqq3cljaL6I8nd2vmk2WV7jWXRfdZc9YMifbamkfdNbVRg
 df9S3AkG9TCDP/witUqKjgnNiQ+QU5yxEYYlir85AK+7EeOtvUUrD4Y
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5qE6bCTtPzfp
 6hmSwzkZOvA7R1iu4Q0J+ZX2lbHW5oxQBA0f3VGw9WbeLwDWuWXth7f/pdy4yhJWZO8s1vDONPk
 9yB1hW0Kw2a/LTRchco8bBeNTH4X/SA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXynVYwBq9OKZH
 gBwmGJBqbfCbJGzqSWy9aQ/JnBxOj0jC3Mw1zK5BC7AXTxjr4JGKF8JfBXlsPp3dmqd+Vs8pG6g
 IO9XqyAzwtvGNXL0S3D4m0mggjJgAYxkwPV5T2ECVQZVi4Pxz8i9tgeznMHqnnKhISivysuY0JB
 /9lYYAZH6VhOpvCgGZW8qSH5NVEszbtVXBcMfrD5aGs2lx63/B9bz2qLkoDGXJMmpyaK9EeNskk
 WU8jsxn0VG+HKXu1JQX0SGqH6GpAsdi4l8vl7f9Dv0+9IzsIFUZAC88BpDxyVdmTFybFdManOl2
 Blz87Os8rjsohQQkT+yEfaBorQPpXS98nBasikRGAhsGMrlav9kRnL5nqwWu0tArFzMY3JV2sAV
 FGnwa+i39hVPqvZlEuhSJQp1EtwVmHEExEZ3eJBeFEbUJark1XSX3aML1aLGpUP4drMZ+caXtfq
 YoWpV3RigpcTQvQ5nBg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a23 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 23L0g388rIIqRpK2K9smsl9OdRPniZCa
X-Proofpoint-GUID: 23L0g388rIIqRpK2K9smsl9OdRPniZCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1

