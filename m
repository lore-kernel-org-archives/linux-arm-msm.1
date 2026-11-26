Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677358;
	b=lYArIKBhGRSS1bKyuxa0GuiIsOxLEq5qtufzEL1C4hxPZCOw1nxVnvPq9oylYRbfw/mD
	 cOcGnc1Z4qG40wNMN37fV9wT9SBPtgbjuTSx97bg5OmSrePEn7e5IegQOHkHiil3Z4OUq
	 8UU5jsYdtacSbcm+PB+59ME7Z/nwqKdvMqmruWtVYrsTnVrJB9c6c2epDxgLzoXpFPm/e
	 6bHEfkekRWvUcxnVwf3U3UxHlXVO0Sl2mLG4cyc36avuQaXcOHqRI9DvEky7YqMIDZJXr
	 8GW8KOPhlX0JQIIJG2mzDHQO3l3VfrAFFjFhkGrytLP0HjGkA9j3iwHfDp2eVzB9nfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4n0YY9nwkaleK1CE/hYC2uM/f84z9cHixYXECTVtolI=;
	b=0MhzJ/JwqYWRgEj6dYaaESY6Nd+2zuOArSV4ToYVOA7uaJJSQC6z/khZAmiFgfPEHvRp
	 GHzyRUZ2tGDhej7AaMAiKS2hFgZP71oQnz8rTTylWMuLApfq3jV1DLrVgIAUVNM1eAP6o
	 QCXI1cUa3bds1/iSNqa7maWQtfoYCt2bABJoemDRTuZOr+ap4lveMj4NgEEVQTJ7i0wKy
	 26AYwkcLxOFCn3TCKRLTxxcbz3xc+ub77suWut2zqV1+zhewAbgdkA829MAV18tGGlBnV
	 +tF98HRVF7dd5DSsVWwYISF8coZSEBaJS/sUCPoda0ZRWGE6kBrrsiHkvR/ZMYV3Wyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VmusQ4sM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg1KOVwR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DA9606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7DA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VmusQ4sM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pg1KOVwR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Awao2175602
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4n0YY9nwkaleK1CE/hYC2uM/f84z9cHixYXECTVtolI=; b=VmusQ4sMmidlw530
	QLHp3d1V10yQxKvgQNM0N6uMIk7qTuxn+crdDtLawbRmpjbcRwjjBNf9PhZR4c9v
	rN29SMm2xH/WYnY96Qu+6om2rraraGsQXRveS3qUIXG7tOonzoR2vSyuWbQe7agI
	j1lvP3rkSZ45Jo/0luIwloCIWZbpKH4wlH7kJ/QWC11UPQUu/ALuIgo3hvlZ04j4
	JySNX1LREAcecFXGyHauTNviz84Z0quIEswxXI6dB+9R3sb7aKClt5ZhIBjneGZG
	a1HO7eje8MbTmVnzwMzsOfhRUPOCHq2CzPz3sbD1KKOl+gwX3OV0kJNXdq/tWqL4
	wwmQPg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahu7sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b5d8de9619so6490036b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677356; x=1796282156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4n0YY9nwkaleK1CE/hYC2uM/f84z9cHixYXECTVtolI=;
        b=Pg1KOVwR8QVdml/eOWSFAXctcs6v/5Jw2RyT98Cv5egZMlP+C3AuOLZuTE0arJ+Ag6
         NkyUPt7pU43H5Y1lZHyZVaqByL3pjAf+JQdTR/MY4QOeRDmD/kgJpSC+KYrnIiOMKXbc
         MJHKCXViQzQWAIzn8gV/SddnRPtdmfOEgPddeaEL7qett+3ZaYqjujLFDhPpoj1CPhJk
         B/sPP4eRQs54agPa6L84f+/qxII7X0CjCz36FwhHwY7N9P0LV5Rebv0gQ80xTGSXIfdN
         JhJWxP93CEkwOfLQ5BS2QG/GFXzyvodz6lLxKXt+1IXwNsXnmqcDNuqXuRJrIlVpAQxT
         rgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677356; x=1796282156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4n0YY9nwkaleK1CE/hYC2uM/f84z9cHixYXECTVtolI=;
        b=y2d9JKcCIapSorZ49D7rSC2phGEsEHPxdCL2J4HHi3wi6amWlgjNwAg4w4Bp3Qg+cO
         6iAp/Sq7TiS48LZiIMIiLIwFso9sh5/4MWOmfdnr899lF2he3c+socaEDMC/tLhM2IF2
         9aSqaTI87GAaGtK6t1JjHVPQfXrcQBeQwlfSt3E8MXQkIdZ+/QrI24oAuvUay8+Yi7Z+
         Ix3xTiNaALDULgiuKypLqJwTX4weuuldb5ahBj+VZXi43YhemchLgM5sJPtVgrUws4MR
         a0xx0AAlTkLteMvZMCC+WuKm3LUv44R18mipgc/LkJ7YjKQCF6SUT2WBgEcOPxdXuet2
         NXJQ==
X-Forwarded-Encrypted: i=1; AL+hErEGSunMOmfpTOZpsUfc1Oav+I/IPjdf88mxS7NU67uICsL7OFZRA0Jj2E9jat0qbvGcIcB0KJ7bJSDWu8Yq@vger.kernel.org
X-Gm-Message-State: APuU4Z+tm4PIrgoW5eFaArPHWHdTkGdtGrLOdBLHuLm2+c4JKj/9vhzP
	2zbKoUNGxoQPaKycWyy+CCk7WMBIdxldTgcsuhbpzzwbemj3LBB4IeBpTmhdLThG6QktcYwq0q+
	QK0XQLpEkNQ3MeAPtlhomjdTFrciiCDEaCNau2IhDT38Y3Hv/PDUeLM0CgomMghHf4qM5
X-Gm-Gg: AZFdTZcHH2zxCSMdz/0vMzr8LxJDElho1ss7zrEDvbEGZ9uSxxC9R0WIAMby2pLdUPi
	7ahiNz6k7kwbqShFYeCEHo0fBhe127229Uqlm4go88RGvS+x38N5fHl4Ckxcfu1TRH4vVfEhmw+
	Tq7ONUFD+pR+Ww9KjRB04FL5UKMhfsHI0MhmAP7BILzUHRovjongda6CBGlP9N3rDUZogWkjnRq
	o0YnnMjza6W0fhmYVyUNDPQw8RgjVNENOrGLRaDR2n13/A4VWYWNiZ9oy3NEOzWTvIOw1IrCbbP
	iJ+GaVUIPVEmvLu+PYGYfXzxK5aiT3SAFVqIHv1+RuWtOolTcGgrCyf+ylo4KL0D0ayAB8nIBXI
	Yt5L07FgMUuG7JPILiTyHSlXf8+V8TIuepyS0t0K1KAw6Isow+fUIGNeyX2XaY2rIFv7pxUc3WN
	Gv7Ii52JR/LZkm1laWACsEECdIlJpLrB66v4/ngSXYWBi3vinfsMe1QRRdcH0P
X-Received: by 2002:a05:6a00:a01:b0:886:ac28:3bd0 with SMTP id d2e1a72fcca58-8c87ce3298bmr18410041b3a.40.1795677356281;
        Wed, 25 Nov 2026 23:15:56 -0800 (PST)
X-Received: by 2002:a05:6a00:a01:b0:886:ac28:3bd0 with SMTP id d2e1a72fcca58-8c87ce3298bmr18410015b3a.40.1795677355695;
        Wed, 25 Nov 2026 23:15:55 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:15:55 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:55 +0530
Subject: [PATCH v4 2/4] remoteproc: qcom: pas: Support secondary images
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
Message-Id: <20261126-oob-support-glymur-v4-2-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
In-Reply-To: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=15662;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=xGHn7T+l+7DaPGT+nWRkTpbyBsFBmYiaBaGT4+VpeTs=;
 b=qF0gmI05IpfmSro738jKzC3in5B6xI1HDs/aizFGbM/mxA3oJoOo3iXsSgsVdSyjzLAzzRpPF
 DHfJXb3fedqA5VnNkTiKl9K5VVMJyE5wJnt/ckrtLu5IhPkqw8s/WOx
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: g3DkjirLzd_bLacIShvR2fQKOY56_yr_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXwdEL+HLCVg2Q
 QdBatLMgKUElkODWoTnASwxD9waIVacwGZGKX0vmxqC1gN6il8WGw6SlmEa1WrQSlxynALfJ9xA
 N+9yandJ5DWxipIrerPph6C4coLfqO8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXw3VvxKXH+Tgp
 kkaj1xWGxzqHb7wfrJfpE6YJSlSvHlRW1bffbMB3nTxZUIYc6pAW+gCnEurOVLs0Jl9NkIOqvKn
 3TJn+xDmb2piiC5bJBoAlLYLYqGB2D/cO/jj+MavpM1+rCqADQv5mPcYsDYlPuZ1vCVNVF36LsT
 jSfxuwuaKJ4YF8thX/pXxo7FZTc401l0Qy459J1LoOxmQEDkjejSbo2Tm1YWeLJpNa/ITTGF/cR
 RO6VW9Zn6tiLOTf+8BJL1tk8qE7O1tjc4i8v7k3DJGKwseJXaKZT55rKcLB7FkVxHenPyC7eArl
 pnB7JJcdV4E0rfYevc5odboEi7pAsIp6RHdVaN24IGj4FsrHlWKhDceRNB9es0KTBgGKWOpnSzQ
 PYWOWXH8osn5JI2LYCFgO20s1KWfyJ6WZ4DmmfdqKVwn1lf6ZXynnp1E80Ks2edVREU/yQkDBb5
 ebMARQXYHUsft+v9CVQ==
X-Proofpoint-ORIG-GUID: g3DkjirLzd_bLacIShvR2fQKOY56_yr_
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07dcad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vuNkxYDJzGyyPSDQklgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
remote processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

Add generic PAS support for loading, authenticating, and mapping a
secondary image and its DTB, then shutting down and releasing both while
keeping the existing primary-image lifecycle unchanged.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 264 +++++++++++++++++++++++++++++++++----
 1 file changed, 235 insertions(+), 29 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e7dfad27e526..1e51371e445f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -56,8 +56,12 @@ struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -104,8 +108,12 @@ struct qcom_pas {
 	int proxy_pd_count;
 
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -116,17 +124,25 @@ struct qcom_pas {
 
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
+	const struct firmware *secondary_firmware;
+	const struct firmware *secondary_dtb_firmware;
 
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
+	phys_addr_t secondary_mem_phys;
+	phys_addr_t secondary_dtb_mem_phys;
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
+	phys_addr_t secondary_mem_reloc;
+	phys_addr_t secondary_dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
+	size_t secondary_mem_size;
+	size_t secondary_dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
 
 	int region_assign_idx;
@@ -144,6 +160,8 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+	struct qcom_pas_context *secondary_pas_ctx;
+	struct qcom_pas_context *secondary_dtb_pas_ctx;
 
 	struct qmi_tmd_client *tmd_inst;
 };
@@ -226,19 +244,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
 	}
 }
 
-static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
+static int qcom_pas_shutdown_poll_decrypt(int pas_id)
 {
 	unsigned int retry_num = 50;
 	int ret;
 
 	do {
 		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
-		ret = qcom_pas_shutdown(pas->pas_id);
+		ret = qcom_pas_shutdown(pas_id);
 	} while (ret == -EINVAL && --retry_num);
 
 	return ret;
 }
 
+static void qcom_pas_release_firmware(struct qcom_pas *pas)
+{
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
+	if (pas->secondary_firmware) {
+		release_firmware(pas->secondary_firmware);
+		pas->secondary_firmware = NULL;
+	}
+
+	if (pas->secondary_dtb_firmware) {
+		release_firmware(pas->secondary_dtb_firmware);
+		pas->secondary_dtb_firmware = NULL;
+	}
+}
+
 static int qcom_pas_unprepare(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -252,6 +288,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	return 0;
 }
@@ -269,19 +309,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+	if (pas->secondary_dtb_pas_id) {
+		ret = request_firmware(&pas->secondary_dtb_firmware,
+				       pas->secondary_dtb_firmware_name, pas->dev);
+		if (ret) {
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = request_firmware(&pas->secondary_firmware,
+				       pas->secondary_firmware_name, pas->dev);
 		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
+	}
 
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
+				       pas->dev);
 		if (ret) {
-			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
 	}
@@ -338,10 +388,51 @@ static int qcom_pas_start(struct rproc *rproc)
 			goto disable_cx_supply;
 	}
 
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
+					pas->secondary_dtb_firmware,
+					pas->secondary_dtb_firmware_name,
+					&pas->secondary_dtb_mem_reloc);
+		if (ret)
+			goto release_secondary_dtb_metadata;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+		if (ret)
+			goto release_secondary_dtb_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
+		if (ret)
+			goto unmap_secondary_dtb_carveout;
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
+					pas->secondary_firmware,
+					pas->secondary_firmware_name,
+					&pas->secondary_mem_reloc);
+		if (ret)
+			goto release_secondary_metadata;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+		if (ret)
+			goto release_secondary_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
+		if (ret)
+			goto unmap_secondary_carveout;
+	}
+
 	if (pas->dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_metadata;
+
 		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 		if (ret)
-			goto disable_px_supply;
+			goto release_dtb_metadata;
 
 		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
@@ -379,6 +470,11 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
+	qcom_pas_release_firmware(pas);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -390,12 +486,32 @@ static int qcom_pas_start(struct rproc *rproc)
 release_pas_metadata:
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_pas_metadata_release(pas->dtb_pas_ctx);
-
+		qcom_pas_shutdown(pas->dtb_pas_id);
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
-		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
-disable_px_supply:
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
+					pas->dtb_mem_size);
+release_dtb_metadata:
+	if (pas->dtb_pas_id)
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_shutdown(pas->secondary_pas_id);
+unmap_secondary_carveout:
+	if (pas->secondary_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+release_secondary_metadata:
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
+unmap_secondary_dtb_carveout:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+release_secondary_dtb_metadata:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
 disable_cx_supply:
@@ -409,6 +525,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+	qcom_pas_release_firmware(pas);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -440,9 +557,30 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(pas->dev, "timed out on wait\n");
 
+	if (pas->secondary_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_pas_id);
+		if (ret && pas->decrypt_shutdown)
+			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
+		if (ret)
+			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+	}
+
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
+		if (ret)
+			dev_err(pas->dev,
+				"failed to shutdown secondary dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+	}
+
 	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
-		ret = qcom_pas_shutdown_poll_decrypt(pas);
+		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
 
 	if (ret)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
@@ -752,23 +890,59 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
-	if (!pas->dtb_pas_id)
-		return 0;
+	if (pas->dtb_pas_id) {
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 1, &res);
+		if (ret) {
+			dev_err(pas->dev, "unable to resolve dtb memory-region\n");
+			return ret;
+		}
 
-	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 1, &res);
-	if (ret) {
-		dev_err(pas->dev, "unable to resolve dtb memory-region\n");
-		return ret;
+		pas->dtb_mem_phys = res.start;
+		pas->dtb_mem_reloc = res.start;
+		pas->dtb_mem_size = resource_size(&res);
+
+		pas->dtb_pas_ctx =
+			devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+						    pas->dtb_mem_phys,
+						    pas->dtb_mem_size);
+		if (IS_ERR(pas->dtb_pas_ctx))
+			return PTR_ERR(pas->dtb_pas_ctx);
 	}
 
-	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
-	pas->dtb_mem_size = resource_size(&res);
+	if (pas->secondary_pas_id) {
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
+		if (ret)
+			return ret;
+
+		pas->secondary_mem_phys = res.start;
+		pas->secondary_mem_reloc = res.start;
+		pas->secondary_mem_size = resource_size(&res);
+
+		pas->secondary_pas_ctx =
+			devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
+						    pas->secondary_mem_phys,
+						    pas->secondary_mem_size);
+		if (IS_ERR(pas->secondary_pas_ctx))
+			return PTR_ERR(pas->secondary_pas_ctx);
+	}
 
-	pas->dtb_pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-						       pas->dtb_mem_phys,
-						       pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx))
-		return PTR_ERR(pas->dtb_pas_ctx);
+	if (pas->secondary_dtb_pas_id) {
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
+		if (ret)
+			return ret;
+
+		pas->secondary_dtb_mem_phys = res.start;
+		pas->secondary_dtb_mem_reloc = res.start;
+		pas->secondary_dtb_mem_size = resource_size(&res);
+
+		pas->secondary_dtb_pas_ctx =
+			devm_qcom_pas_context_alloc(pas->dev,
+						    pas->secondary_dtb_pas_id,
+						    pas->secondary_dtb_mem_phys,
+						    pas->secondary_dtb_mem_size);
+		if (IS_ERR(pas->secondary_dtb_pas_ctx))
+			return PTR_ERR(pas->secondary_dtb_pas_ctx);
+	}
 
 	return 0;
 }
@@ -910,6 +1084,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
+	const char *secondary_fw_name = NULL;
+	const char *secondary_dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
 
@@ -934,6 +1110,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (desc->secondary_firmware_name) {
+		secondary_fw_name = desc->secondary_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 2,
+						    &secondary_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
+	if (desc->secondary_dtb_firmware_name) {
+		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 3,
+						    &secondary_dtb_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
 	if (desc->minidump_id)
 		ops = &qcom_pas_minidump_ops;
 
@@ -967,6 +1161,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		pas->dtb_firmware_name = dtb_fw_name;
 		pas->dtb_pas_id = desc->dtb_pas_id;
 	}
+	if (secondary_fw_name) {
+		pas->secondary_firmware_name = secondary_fw_name;
+		pas->secondary_pas_id = desc->secondary_pas_id;
+	}
+	if (secondary_dtb_fw_name) {
+		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
+		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
+	}
 	platform_set_drvdata(pdev, pas);
 
 	ret = device_init_wakeup(pas->dev, true);
@@ -1022,6 +1224,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_pas_id)
+		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_dtb_pas_id)
+		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;

-- 
2.34.1

