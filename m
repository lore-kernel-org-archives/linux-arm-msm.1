Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406643;
	b=TpJEjXTwDEqW2Yc950v1f5XZp+X+blVgrKuJXHtipKjDGTRfl2tmXFy9Y09vLBF6SbRu
	 F6Ndohu3TjCZ+vRNeI1Gbdua46QDLExMTAHF0+xtlH8Db824ur7zsNh8R/wfw+amMq6ZJ
	 pKUj/HTeBKx5z+MUKHqSJhkOSqXx35T0RWaykkM7kU36ReoVEAljcfYsVCSOPpVeEFh8T
	 hwg7inOkhTYZwxV2A0icOcZTsnQ0djaOY0YE+ecyXbOVQukwvzfKQ8MfeNL5a+I7vIzIO
	 XML8FPKmRAlGNEZSiffyIulXmxUChhv26ELpRf0LAJf6r8szRVdY+SPDCf3SGA52j5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eW2UhyRiYSQk7BrcYmKzFS/v8E8s6f8Ay7GtoS+hhwU=;
	b=wpKVic9faWP5qSJPngpfYVI5qvGn/REgSeDQHl4stsKmI7olXsfyMRh1eumyuKjXjUSG
	 COKtmPGnSeqBN/0Pj2ZEG8u9V54W4Sf8QmwSkhJShaSz+6Voaifbu4/TQv0roM0qaBzOx
	 G90ZS+Qn8KVP/uvMyvXP7qFnzilXtHuwnG/YpWum/gMcb3roOENDtKsu2LbMyJ03LgDyd
	 hEepL3c6uRBvIUlC1ANgWPWbJ49nt2Tgz2iTlho36/hLvGEnCtCJoov7LXtkx/IfunNLf
	 3TEv+sT967t3AzCYrcDJAp/rNLnWGzD7YSHGEeGwmyx0/7vCu/a207HZOfGKwAGmLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKFpuinj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGkqqwyg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68103606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68103606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKFpuinj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGkqqwyg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ3iU2001472
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eW2UhyRiYSQk7BrcYmKzFS
	/v8E8s6f8Ay7GtoS+hhwU=; b=jKFpuinjau1zLYnX5zUchqtM3aZ6lC8IQXIAtV
	eyh/DxW9o2cfReyRrOJMmXrjbpvx9zA9yp/cT2fPo4290pTbJ/sF+DdH1atkrE9Z
	T9KwMi39K/CfdWgEjHmpWA02DI+lUSvCbi3f2F82GR4sH1j1b4aj0AEkRMEbgGOP
	leACprW7BtwR73xSGOtzjG2mWM77Dv/eBqQphtsSZr79BBmgybqKCTKzXDnCf+z5
	/PXdRoBfjJfxzVWRpYjtUPN3Sc62iuM0otkOIvbxT28qfRWf+927XkrSKgCDommW
	vZOdPjZK5wr64vPIJbiEPkAAq8bNqC9frQ2SMkK9SFBFIkWg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh30jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:17:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so4238455c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406641; x=1795011441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eW2UhyRiYSQk7BrcYmKzFS/v8E8s6f8Ay7GtoS+hhwU=;
        b=CGkqqwygIBIMCyOf+eJlxTdMmBsxjwE2G42yybuF1qcHvvGp8KvfjIFiC2vvnjGC+M
         1S3RxvSmYYGhVrhU44l8hEjIPkdd0AoXcLC6n4BQgdwQtMqYRCc1QdkLxfeAaHcLNXSc
         JvVnnkQiY8RO3mt+ovTra6vLDtz/lyL4q8Ea1c2RPH4JTDZ9D1KboiB7WBDbDr7c4FF8
         htKWVLlVI/wNIhUgCtIn3z3zebTCf5JTifZIEpuCZS36TyodUQBfaEP4KAF9K3L6D8t2
         wkeFq5I9w2KzRLWfBIZ4I2EKu5Y9KiQdz0vkHAoOdHphbpYeqgYAAlGoJoKMXbjj6723
         B8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406641; x=1795011441;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eW2UhyRiYSQk7BrcYmKzFS/v8E8s6f8Ay7GtoS+hhwU=;
        b=M1rZMv6QdkJefNdgogSBgDtgtifI8tSm+rrakf1zUgDAI2TFaQw4TmX0s1Q7LNk4l+
         XZBdSs/RpNJQ0HxJT8fIdQYne3TEkT8T3R3Z1T9goV8pfidbm66wlokPSmQBTTCNF+Fg
         76HEhQbBpqzOpTBTFVEeCTpEOpk6Od6T4jGUN2I/NhidBMVu7foTTceW6TxQGwPuERvd
         edQXV7m51h/PJqlhFQnjF6P6zK9zobbRd9emy+/tqsOFiPHEaZnnbiS9CV/lILCdYy9M
         +e8CLBRfVraVPExz5WNQtMR6PLJ0L63QiAeHuF/wb2iHsKW8PAUWeioZh/2MkBHDNkJG
         shoA==
X-Forwarded-Encrypted: i=1; AL+hErHUz9QoybdEiygkSC7VvLxI0z5T6nMZptq7eEwN3Mkb/69CyYEx3NcoXA1U3X3bzo2gdskw2K5TrW8C4W0n@vger.kernel.org
X-Gm-Message-State: APuU4Z/KQb9qgpswvKNuQYDW0HJNRQx+Lrcuk9Fetj50tpVv5RnOBzrg
	qi4p2cMHOCP5Dfz3ySk+IgyP2Wg7aTrMHPQRsDVMZFnIp2AXCbcXrg2ZpiQMVI7w+blT53W/uNp
	iYZ+73YtM/y9Tu6WL5XfOUZFku9qy88kMJ9bHo6N3eYg0JH6QxBPwaCmTDgF7EyUro8nQ
X-Gm-Gg: AYBFou2oSmqyGU35tRMALpnFp7V4JOYN1HphL+boZ2KAi4sxREErX/5iEmUEUtgWwZ/
	gk3EYF0ej6B+TDhxivleJic2kKxmZnSfHn7nnITMUqK3US4nU/rpjC7NtQmW5hMfbavSBJWZI7q
	4U5Te3LwnHoMa6fuIfSSiMwHXlvEONTw9r7QmdfIMt23x1QIeICIHmdXaBgZeOphgRagqi4yEmG
	yxICIVJiNs3eiJvE5cVb5irkqOO2Dkj2lKa7C54xt1LOajNLYUrKtp9glNDDIWNbaMGNtaFK3Ef
	hUZw8PCubtJWAQ9vWoYKi2wilmPuB0xp84JK4TClKsP0DcfyT/wZpN4EKdAh80rl2cVocZNoH/U
	ObAWa3xv3goh5A30k7JWt7LqTiAGJ1dWNI41vloeHu1hjcL/ttDogfIs2QbEmjh3Tr1nst6ZtHA
	==
X-Received: by 2002:a05:7022:ec04:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1b3c02f12demr2549959c88.8.1794406640700;
        Wed, 11 Nov 2026 06:17:20 -0800 (PST)
X-Received: by 2002:a05:7022:ec04:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1b3c02f12demr2549910c88.8.1794406639438;
        Wed, 11 Nov 2026 06:17:19 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:19 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add support for a TEE agnostic Inline Crypto Engine
 service
Date: Wed, 11 Nov 2026 19:47:00 +0530
Message-Id: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANx49GoC/32NQQ6CMBBFr2Jm7ZC2BAyuvIdhMZQRJhGqHWw0h
 LtbOYCbn7yf/PdXUI7CCufDCpGTqIQ5gzsewI80D4zSZwZnXG2NsyiecZIh0sK4MKMmj1T5vm6
 qhrisIS8fkW/y3q3XNvMouoT42U+S/bX/fcmiwc6UVccnos7QJagWzxfdfZimIge027Z9AUUog
 ti9AAAA
X-Change-ID: 20261021-ice-migrate-tee-svc-a5cd6959ae36
To: Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=5437;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=x2E2YNTKZj3RAxxnbF3g6SwjXlGHcONpTaIQkMBGS/8=;
 b=64OiN5sq39/G16H5ou1+rLokpwVcvzrkH0yaWTd8gn/Ai1zOhL8xzA2W3pLJfDv644uNNdwMG
 1/80Bm4d5mJAbnTJpH7f57ohtu6p4Vn+HnsoA+f+UjMIwlzUsxVELm0
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXxI+ZoI0AgTbI
 r5rj7nZ7bv1ssk0zRU5aCgzStm/mtq0uoWngGK89HRqN84GNTQ/VlG07hqVC/TZuHT1VFdkwjyf
 fem9FZcRDkyEVoHsWueRiNLX9DADd1I=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af478f2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=_EMmJvYMAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZDveMJu3P3cY9s7oh3gA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=emCv1hD2LFd8cNRmW21v:22
X-Proofpoint-GUID: fdZ2oOf_mo8toXtvXhtBpd4Gxuxfqr_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4O/H+EGRi0Ku
 a+ABuWF6RjxJjDbSj7vD2JCfHd5D3tfuOxdN0Dkskcgz3CmEV+ztkR6U0yuoJ15i7WD10jlEmGs
 67WykeH0l5gHxwGEY1ScxB8S5ACnJtAAj231YsTrVmHiSg/drVZJY0FiToSsERV1uPo/4lpSi4d
 Gp1rTrphrDomQwXtgLKPhHWu9vKqqSi3Xq/Khrpsg7kpZ9L5rJy+nL+DIVll/I66Tsq5E6EcD9Z
 VJjsIc7MaxNDj4SCYgxDVppU2NjD3T38EJxdm11RIorBXeedZmFjOy1rHEpWSe99iiOLGeqseOS
 3pLqv+yrFYWqYsvQYHWaqk+4luUumWknp+l1kB0CRFOj4HvYPMoL6p4HF+DCqwN6cR/k3xEn8Mx
 Qpqy3XkQ0jRyLry2AufYfeGmY8VsmFkhXQPrCfNr52EEz7Y9AIqbwX0mcPEJM4kLFscL5YDuqeH
 eZ3uDrHF1N/GnHdMC6A==
X-Proofpoint-ORIG-GUID: fdZ2oOf_mo8toXtvXhtBpd4Gxuxfqr_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110056

Qualcomm platforms such as the IQ-9075 EVK now boot with both Qualcomm
Trusted Execution Environment (QTEE) and OP-TEE [1]. However, the Qualcomm
Inline Crypto Engine (ICE) driver currently only makes SCM calls into QTEE.
With the arrival of ICE support on OPTEE [2,3] for Qualcomm platforms,
there is a need for TrustZone (TZ) agnostic APIs which re-direct the call
to the correct TZ at runtime to request programming of the secure interfaces
on the ICE hardware block.
    
This patch series adds such TZ agnostic APIs to the ICE driver for
requesting secure services from either QTEE or OP-TEE depending on whether
an SCM driver back-end or a TEE client driver back-end is registered with
it at runtime. This series is logically similar to the one introduced for
Peripheral Authentication Service (PAS) [3] which was recently merged to
provide a generic PAS service for both QTEE and OP-TEE.

Apart from introducing a TEE bus based client driver for ICE, this series
also adds support for optionally registering a TEE device which represents
a particular TEE (QTEE or OPTEE) on the platform bus to enable drivers such
as ICE which poll on the availability of a TEE interface to be notified.

The ICE driver is an independent platform driver which polls on the
availability of a TEE interface (SCM driver) before checking if the ICE
secure service is supported by QTEE by querying qcom_scm_is_available().
The TEE subsystem currently does not provide any mechanism to notify the
availability of a TEE interface, i.e. whether QCOMTEE or OPTEE have probed.
Without the introduction of such a notification mechanism the ICE driver
would indefinitely defer probe until the OPTEE ICE Pseudo TA becomes available
on the TEE bus implying that for OPTEE builds without the ICE PTA enabled,
the dependent UFS/SDHC storage driver will fail to come online.

The TEE bus based client driver introduced in this series which registers
with the ICE driver has an ABI with OP-TEE that is 1-1 identical with the
SCM driver's ICE ABI with QTEE. This is because both TEEs implement logically
similar drivers with the exception that OP-TEE currently does not have
Hardware Key Manager v2 support and so the inline encryption functionality
with OP-TEE is currently limited to Qualcomm platforms with only Hardware
Key Manager v1.

Validation:
This series has been validated on a LeMans IQ-9075 EVK device by attempting
file system encryption via the fscrypt tool.

Merge Strategy:
All patches in this series except one touch Qualcomm firmware and soc drivers.
Hence, it should go via the QCOM-SoC tree. Request the TEE subsystem maintainers
to provide an Acknowledgement for this.

[1] https://ldts.github.io/qcom-buildroot/index.html
[2] https://github.com/OP-TEE/optee_os/pull/7906 (In review)
[3] https://github.com/OP-TEE/optee_os/pull/8137 (Draft, depends on PR#7906)
[4] https://lore.kernel.org/all/20260702115835.167602-1-sumit.garg@kernel.org/

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Merged the furnctionality of the middleware ICE service into the ICE
  driver as requested by Eric.
- Introduced tee_platform_device_register() to fix the issue of indefinite
  probe defer in the ICE driver when ICE PTA is not enabled in OPTEE as
  pointed out by Eric.
- Fixed type "Psuedo" in ICE TEE back-end commit.
- Fixed space based indentation with tab in ICE back-end Kconfig.
- Ensure tee_shm_get_va() failure is checked and ERR_PTR() returned.
- Validate out_shm size everywhere in qcom_ice_tee.c
- Zero the memory holding the key when TEE invoke call fails.
- Check failure from qcom_ice_tz_ops_register() during probe.
- Cross-check out_size and lt_key_size in qcom_ice_tee_generate_key().
- Always return 0 when qcom_ice_tee_probe() is success.
- Did not collect tags from Abel since significant rework undertaken.
- Link to v1: https://lore.kernel.org/r/20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com

---
Harshal Dev (6):
      soc: qcom: ice: Add TZ agnostic re-direction functions
      firmware: qcom_scm: Transition to ICE TZ agnostic operations
      firmware: qcom: Add a TEE bus based ICE back-end
      tee: optee: Register TEE devices on the platform bus
      soc: qcom: ice: Migrate to the TZ agnostic ICE APIs
      firmware: qcom: scm: Drop exported ICE wrapper functions

 MAINTAINERS                                |   8 +
 drivers/firmware/qcom/Kconfig              |   9 +
 drivers/firmware/qcom/Makefile             |   1 +
 drivers/firmware/qcom/qcom_ice_tee.c       | 443 +++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c           |  90 +++---
 drivers/soc/qcom/Kconfig                   |   1 +
 drivers/soc/qcom/ice.c                     | 173 +++++++++--
 drivers/tee/optee/ffa_abi.c                |   8 +
 drivers/tee/optee/smc_abi.c                |   8 +
 drivers/tee/tee_core.c                     |  21 ++
 include/linux/firmware/qcom/qcom_ice_tee.h |  10 +
 include/linux/firmware/qcom/qcom_scm.h     |  20 --
 include/linux/tee_core.h                   |   9 +
 include/soc/qcom/ice.h                     |  56 ++++
 14 files changed, 784 insertions(+), 73 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-ice-migrate-tee-svc-a5cd6959ae36

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

