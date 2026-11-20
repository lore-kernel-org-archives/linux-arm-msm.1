Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172870;
	b=NXTMFuUTewGO6mJKgl6OqUq/D+03TtJ/FUReMZNAHoWsQ1dvUxtZ012346ctsX+GXGr5
	 a5qiNc1+gNXrF7W2ug0n6ou0SMslle0KL1JgV+sfnXYfqFEQvhVUXG8OtSlDHIlT2ZUBU
	 bP/p0aJTC/Zyy9PRv3Z/a6mK+js99RbZuAKoy65jeEUe1PLpcNaZePooq0KQ5Pc8MNTPz
	 gylYKaXybRfnuZIdEPGtTNGFFN5u204H5Vc3aFdmFZM/HSaW+0L5dVnbsjXQ2I3iZY0xo
	 QGuo8ejT6GWqD8p4R693r/jHDEbRnOTi0z3Nk2zFpSGWZHd+qcPTWP99s+B1u01VUNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
	b=jniLOGAKAtH6EQrS19k48/KdNOTwqRlAwjSfO8BkpSF3DQtgixPW//FCrRmrq4hAsvxR
	 qNjTJ+4FiabL00irZtmAqr3YAOOWiUNmsODmlGlH1zBHITRpklzJbD3ml62RoUjOna9Rv
	 ++4zkvGBVImX/7qnaOf0QXolODX8KvJsRvjUSVPeTqbO4oO/VE8/IzzmYfgJ6doLokv/U
	 lAuZ+2die6vyoZ/3slKkTN/Kcn/Qr1axD7NmDttZ9MFHr1dEzk2cOrnz42AWYk6Nc/CN0
	 +fuTrUTxIZ5BLc+gP/BCf/HvbPk2u3YZlp79DbxKgrT4lxTnVYT6bx97IUSVk8snhUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1CaV0Px;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IMxWqQrj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E7606D864
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35E7606D864
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1CaV0Px;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IMxWqQrj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkfgn3107601
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=; b=m1CaV0PxVcpSnDiH
	28HPG+7yoOHUsD6TQ/EMM+wsgLcFbA6mkd7Xv7572Jaq4kNDPtW329NS7BakGtCO
	nrxFpq7LsTV/3rrlRXweqMg7ZDsLj/EkxXKMDVS9T8Qe1xEWpX5fitey+N6hPETm
	vnlpcFqRFBcJ1iXbRmlSwsRoOjGiicm6NyCcQ4HWkoOtbdZfNV6C89IKE1r1y/eO
	i5ccwBVnU+IHv2iFd7OgPgDvlFfimE1TYVwMYilSA5giPHg0kCNiBmB5BOTHh3Tt
	uGjy8uaRyQ+4slp+ZzTZwn7ZtP5ybm/WAkO/OpGj0XMCmYiu1SZ1p9cHEkmzURPT
	PntkIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3bxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1353961eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172868; x=1795777668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
        b=IMxWqQrjypFQWm3zpXGzImmG9XTjxldNUUNiXrJ1BTBR+cvfy2jSLamCop+AcZ3ssS
         sWBN12wx+qEZw8MO8IEDCtBeR6Lf/BHhnowqIRA0ptmlytxTVmM7XhYlgOk94CTaYach
         GTAvAuOQ4SRaOGHfc+TzfaXd7eDV7lLXQDw3GKv014UpJ0EjPSiCwoTwZDiImyJkzMuC
         hSBE1qnkpl724XPGf7Zp4Cp8PGFW27qP34X/4gdu51Fqm0nwtW+NgiNWeNJkKVZPqtQv
         Ar0KVASND6l30tGRPyhtBMKFXokdWanA7SwhsOeBjHmE9EgNPbPK7IkE3xp8Z9tEPVoY
         7wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172868; x=1795777668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
        b=ImzmqnUZP/lX8F00qKW9nR9FcYVDVrMNx7O/Pf0obs03QtQiE/MhRRFtCoV7H2Bomc
         69I/yERrxK6F6+Js1UW6RcZ9l9raj7fY4BpDLEom2HvjfhXl+C9fStIaLk2oz68iyWsZ
         xVYZAb0OkKkPyktQi79DmZj/CDx2qWNSwIvgmLo5emi+7DolVpWL7A49YH8vA0S0gZD+
         y7QpJn0a7ttlGmcFLUoqzn9ZzmpkFzvrbDvvHIpuWDckPooz6jJDTLfjS1gUIt4gWtP1
         YVNUoRLGw04nYZxiiYwNSfZr78m4gqoKLyP6Oq9EOVEW+nLbSwOL+yehuCgw2NkQJaJD
         lM/Q==
X-Forwarded-Encrypted: i=1; AL+hErGT1SK4CUfnQp/u8GWt/5B20YWS+zO2UzHXf5RtVCB9/wtn1aMseCvB54EHbKh9voApqtVzXCaQrqWezh3b@vger.kernel.org
X-Gm-Message-State: APuU4Z8AmBzNA4s17293IdawqvE8i1wRi2rWXvnzXfYwmYlgUeNj7IyN
	kl0n/xfuWWFDZiInZit8FID3Q8ZIlXUwop4lambrc8w73dTGFXs/DS06HVp6rkbpRJTKoFquy3I
	phePmXn2Bt1m8KlC1YMdJBKHZi3zoqPvx06cP0WVASJ6NNET/tc0txWPyVJnxrdq/Ogb0
X-Gm-Gg: AZFdTZfv2y5mNVXjkwJKlISF+iBDwfGFfowWGrdw/Wspa1WhVWQ2kjXrw73o08f1lBQ
	+pQtCADuefpF8eLDD79KjDij6kyqd+bKfbOb3Z4ySaTcjXwqMAeBDIHc06dcrZhL/LH6K2c0guu
	a+NiirhgHXZsbyzviibbsjewcVjsYycB7mzhsEHkgoq/7Z7kKG7tLQtsZzc6920FRfFfJkE+1Zl
	Bpjq2sknZ9FkR5NHuRgaXWG5sELLG27nP7Q9uR9r6ISndq5W98sECiRieMGtV++z6Qswol986SJ
	IbXxLGun23TA/iWJ0K9JcHBBdy5uudngnHmF7SRuNf/WHE0fNanu3zmjE1Y5giNRJw7RYB+2h7n
	1SFaLElz8dbywCcgh1wZajrnTMTac0VDQBB/4Gr3SLeN3Gu1NMFSUPOR/3M0Apwxfq7rb834Vif
	uckSUm
X-Received: by 2002:a05:693c:884a:b0:386:319b:fb11 with SMTP id 5a478bee46e88-386319bfd2dmr534053eec.1.1795172867389;
        Fri, 20 Nov 2026 03:07:47 -0800 (PST)
X-Received: by 2002:a05:693c:884a:b0:386:319b:fb11 with SMTP id 5a478bee46e88-386319bfd2dmr534006eec.1.1795172866650;
        Fri, 20 Nov 2026 03:07:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:52 +0530
Subject: [PATCH v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-11-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1283;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=53qBBgRq2wi2XcZ5N+kmy8C1bgB9H+kOxJMHwtLtMZY=;
 b=TYQkalhmPfRM8mAGJ9GWhGPKxKVfz7ouAdcsaPaImMCvOGkdYQ7Rs52zM3FA3LYB//N4CyiWF
 uha/csTA3G4D314GdglDhRR7b1/8Q0yEdvi1WsHRpeEW5EWV4GKPUPC
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7fMwtwHu8YxB
 Vg1Ju0nrv0PESY8mx3GvUYjKUxKBdHYe6lJQ8BUFGNznAIlkYCpDdNIxXxYZibMfzoAmV2zxUF/
 L4UAvqlYt+E2PseOfrMS50ebtjOYk7E+pKmlpRCXyGpHo5cXnTOTpDoWDXCLmOh4rHCzdTMjjc1
 De2hU/Nwy8TWFajNmWYZ7L/S+wHioHasePpESD619gYbwNOuL6KwdnJHs/Wc+EG17rwwB/fHlP+
 LMmMcNWIiCPS7DH5D/bz/ysvitK3RGSgvJnHdeKbQIr+2JQdAWANlp4uL4FkvvtlFvhpDgPkrSs
 bb29WtFjzefLQ/nf5zOquosr7bRZC/CM3TAJ48XXrD4qw1vZUOGPTIXAN2ao5yF6DuC5ZdsCld0
 /hNBHqkwts3ay9YM+rZw+wo+C1EqP182VJ5Fs8MtGcGnx49/ZRAJ5ZaOAPsKrtSrwi4g2LqyXR/
 RZt4p11ItUsRIiEsZLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwoTPDs+rf059
 m4tHek5zWJ6XWTruPWwMSLFBlvCMuBLqyPc2mAAcmGubEbGeGZPv+Ian/QyqmFQnKkmW0icgaAJ
 k/7rLPxZSSblwIL12MHxvAKaXxWN62E=
X-Proofpoint-ORIG-GUID: RVVRlUEJVE5oq1lqmigHcl4fNv-nt_mW
X-Proofpoint-GUID: RVVRlUEJVE5oq1lqmigHcl4fNv-nt_mW
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002a04 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..6eae42384a18 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3405,7 +3405,6 @@ gpu: gpu@3d00000 {
 
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "gfx-mem";
 			#cooling-cells = <2>;
 
 			status = "disabled";
@@ -3564,6 +3563,8 @@ gpu_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		sdc2: mmc@8804000 {

-- 
2.34.1

