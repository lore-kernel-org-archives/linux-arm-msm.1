Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172853;
	b=Sz85MXBa37x6RpNBHXSHdYOJp/zL94hNwXm6qAnY9Q944Rbm3fJW4gIGPVycgETzy7jH
	 pmvnfBF/DpteCKccQ7x0bUeFt+ebXNYRioRd3BGC2VvR3lLnojV42U4/dqAeV9vLLq/lg
	 7CT+xkpQY6VvNgpbO1EgNHirTqTaG65riK/2XY5S9aRikn9F/r4TwfIzasxMatGbamz57
	 qpCmhtNdGoMRY27BBUnJdJJGMaC1i6mZDsFp2Z0Tzg7qAjShaqRmcw4MN7z8EpQhNkoDh
	 Zicm6/T4NFvkEIcz1aB70sR9wK3LDd4KumN3+9aveasaXpLx+k1YMIhnvj5+cHHJM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
	b=C1s2dbkoS9AE8zVAvSbd3GLDsX34Y4vpBmGUSKsOKepOEzeYbT3crW5Y3EH5UKoATWYg
	 vnp6BKDprNEWPe3RZnVF2T3qbmc2xUzo3eYsZEdvHMCN7AYHVZRI5JZPsrl67lGEoq4Kg
	 lzP4wT4iCSnGcoK6BzaQb2aNWndS/kHDtNVCtTlIyJvj3IMJRf+fnkgz4LbYqZsn+Rgr/
	 Hsx9irPcNfATkcVc8CvA4K3lLBdOrkC52xfGSYxLfYXv5sUtmMBoqctoIk3rkEvhFwNez
	 R9bMRwPqDj/0VRDXFLqwAh4QRKlf0RZREX3h+nrFvS0fCspzxAdB8a66okhOHY51r9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VnN7/0Pz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6odQ5LW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F9860A6F70
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F9860A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VnN7/0Pz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6odQ5LW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6OC3987225
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=VnN7/0PzTmZ2Un/0
	zIrk2N5Orv66HzLZe/Es24rOM2ssM4YtTEl8Mn+GL7AgPdhGZ6dgHOioe9vZZFNs
	DiAV59MKWHylvv96yU1SPzSML8oTJ/v+8yldAv4WAHsTGysNjIW3K47gfW1Rd+HR
	wcA+IuMyvxHIr0Jb1+5Kb4quagR6QA3l3kjB8TYAV96zHyaTrZwvq4qvDnPSkQ8X
	2QI2Sc9wsqfN8EiuCzCxTHpDgvkqpfYwjQPZNei5PvwtJpIGpmD25Ovkjob+hqRi
	Dc46oHG9t7DnTYRVhu8cix2ih/OWgskDTtlFeBnvVnaqVz1i3JsPBTDNTNV98adA
	Ue7gNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu8142q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078605eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172852; x=1795777652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=C6odQ5LW1JyPJc9NfLgMpjOnPc9WNlAo7vbQUcaguqJIU5+Hb3ESCNfnBjku9Yuz1u
         6rPMi/9BsR0/Z1xygebDIOBdXi8tolFhKTfg8IGpU2wxNV/FsbiYu2cXs1USH9pW4pEx
         sOG4c+4OKfUeKd9piQmWayNH3XXiD/r67FvKOvVReAJDSRK8yPTZb7Kk3iu5gbCOB9e7
         +Ede9OhCL64v8VehNSxw0z1o0UyOEpCFcyKC1Ux2RtzNsHSxbfi3T2DbWnkdZ4MJAdNN
         YODXgTm2RxDc/KeQoEpeN3PO2UpqhmTOtqSRnZlpltEizYGAZxEJ7LtoyBT9s553enZ1
         ujug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172852; x=1795777652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=GiOTxoTAiLqHlyOKR2TcWXU6yfUOEy+cPwBajezzR2/xEAyf+Z3/vE8L871CHDeL2p
         mb+2hogIDpzDTxFHHqJQkGSQXPGz2zB2Z8uIJKCubFylwwpwc6zvXlBtmk+Nc88Q4DPH
         q59TXBqkCHsj0Hz7IQC94DrQwdVffHZQRxn2mbm7uikG0ZffF/RPj8T8VjYrA/wRbAp0
         rBT5TXPTgFDCEJ5/EGB06I+bj4sXErzugHvzgO8OblIzQuyA2ouI+mrunp5+3PgED5xu
         BfTJp7FXKw73lvvjwnhW9VrR+eYgaUlEpsanfu0iB7E5w3A5QVeYh2nfjZwHFFwuAUSR
         IUkg==
X-Forwarded-Encrypted: i=1; AL+hErHnY/ykm5pHMH1dLj9OxrNTP2++iNVfb3Ourh3rtRm0g6y0GCGRo0pXeHuTQXAzrcRqbpU7ikEaZEwayWc3@vger.kernel.org
X-Gm-Message-State: APuU4Z+yYH3TYWk2rdkAGwQ1KkY8ZO9/VN9pN38Ocq5+nbKs/uqj09eO
	2B2I4poXz1SaW4jYsdElixHrO7JfKwkyYSpdX602QDd5neIxKzn6RpZZTGsyKso3poxomxzwicB
	l1bBB8i45ymZlzsgsYSxdBn4eNiA+1gXzjWylnYIO9UfwMFsbutHdPq4MF4DCEWoeimo3
X-Gm-Gg: AZFdTZd59h0PZSgpHOl+AWAm8NBbo/X8rONOT7peagxF5h7i+CpuyrJglbG6avhTWGw
	dG1qQea3weckoxZUJ4V/uQGrOYGmIufEM505R+ZtrXTsNx1Dm/5DsFp9McAxUV+EdqlE8AgCF8H
	6WpIdfbySKyWFzwqe6ZUolimvqc1JkjfYDIXbMZqd7Ocmq96a70ZrPINdYZwuh/02qygtEJ+vXo
	W89bczt5EHnmpwKhSauQBT8cOItNBwpIwlx7aQE3WLVGvw+0g0xFUhwLahL2/d297L6ypPYGWPh
	uLRdLnJgXNeSkIeEZ7D3HbG25ptJZ74SS/bGRy6D/GHkwIZpQOK3DRMeSjFRBb2Kh/BSR0rsohk
	SmcoAlhpdKqBgIpDVuS0iXACP8mmdlfo6eMdvttFPAfZiNSOrRa1BEpuoqqY65COMcCmVfN+IrL
	BcBn6u
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3103019eec.23.1795172851651;
        Fri, 20 Nov 2026 03:07:31 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3102974eec.23.1795172850989;
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:49 +0530
Subject: [PATCH v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-8-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=2QSTYCJTswayLaRtH+B8G1NNWBpnaZuzUwYJDYa5ujCqH09DMFxaY3GcRjghHbNwCvQg3CFqR
 pHhnKyLIK8zC8y+M50UC9afzeFvT+6TpYpA4Z5kJbURrxQvEsqL1Ibu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4x+L7lYpkjm+
 nfY/J729gUPXF+qZkFHZ6fEsA8xOrdzSb0Y5XBOfS3++rGJ8OgVwuqbjh5lziC9OU+rFciu0Aad
 0OqGGagcokHAfNqP1LBApOZlbvZ63Ag9AWklh+OlRNCEqMvSWz8h7271VLbxU78nGPkTwsUwxG+
 dwROxkZUQfVfXO16DTb/KcHcz6YKnsjSqbxtRIeHoulEeK12sekS8CkzMwhvTW62LpXy5AwVN0m
 YHEt3lsJrWYJyj1yghIHpCZSIVAx6VFOMrEVCxxRjLF9lMd3R+Qe7G2h5LWzkQ4xC+2H1Jdoaku
 00CTF9Lylsr1lTWLm+dyNP6nidXk3cS0VNkmuZbrvjTl/zmACglF0QB0Z4iSqXFhHemBmcOfSwy
 AeIDzsEYoEiuE6l3M1SwCNG04oPe+fE9Zhdw66PWuzVjG2ZwvvdLZFuLJYggivTRmWZSsT+GvXG
 K64eubWQMDcNOP9++5A==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0029f4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: vxhxCDgcLbCWHsyJ4Ez5xPvzlwEUETos
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2xxxeKYwpDaX
 goYBmczZfWxeKIldTtMjdTVqCWmaN5A4Rabpqtu41YASscFde/gdcI9+9Snr+5NB/JeErxkEAEP
 2GZE3gxUlFMwjwqLUUOjmx4K3xfut6Q=
X-Proofpoint-GUID: vxhxCDgcLbCWHsyJ4Ez5xPvzlwEUETos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1

