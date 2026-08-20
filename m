Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16BD257844
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236303; cv=none; b=AGyUCBIkZQOp+y5X+NWX3LAnT22IPSb2IusIKRVidi3p2i/odHax8YdTQxmh+LhM3qkK4phfT74T5iMEARJRhi9GKL8WH0XdMHgXfIInP+Qf4071bUBVbV0bWizpj3Ip6GCEYQaC/5qyE3TAgPnObjOFvrlo21VqBeY9s1nVHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236303; c=relaxed/simple;
	bh=cfnpr8w4exTVb7D4hekpomYCJ2mAqjyh/p6qZiUEzJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvBMWK9CoYS9F3RJ1Xt+fVtUEZCPXwjVsMr7AaoW7XXMbqTHBH1S962NYxXUixs9EixFlulAY1G8uuL3+g6hWeepDzKMEADmyObNGMHpYgE9Ld4TiAImiKOaBk9ULRS3/AzW3dOhe/ZO4CmfVrFw8D1MRdxEmIVTQp0D8nMBA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZjXr0lu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1zRdT39; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZjXr0lu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1zRdT39"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7qdt2444577
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRJrBAJIIuvN/ZSCg19dnsWny7L4+vdYdyZCNWvV5qU=; b=gZjXr0lunuQ3G0Un
	V34M68L6shV/oh76Vo4becosqxZMKqBsDbNsle1cgVMtn/TvwF3djcY2BhTsU9+h
	5KsedT2LHIvaZIs1qoKaNBfw2ET2usGHY5Y6JLHj0itUgF0W++QznRBK7e8kbU/j
	ezf89oWm2fj40AvxJoIUWfsFvziJ3Wm7FRRb5ZShbPsuAICND+l0rhFNRjZ4G1dc
	TsS/RgjJsJ8QxU04oF3APR6nsFijbHFsZBogtpKT1bEPiwMyms213KbiLsBEP2kr
	GJtaus0AzFv8MWKc+bzm+5dwg2s/5qaOOqfniQkiRzKW7xQEW4mO1aSiJTM4wo/Q
	xXOH3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05sfkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so243882485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236296; x=1787841096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRJrBAJIIuvN/ZSCg19dnsWny7L4+vdYdyZCNWvV5qU=;
        b=K1zRdT39nAGSJLbsCxjyKefv937a6/3K1hNaLMmdOqjcG6zLQXbDmR4ayzFDPMxhay
         0emsQ+d6qQdQlRTPKunloDEtjU/A4ASZQO0DBavE8g1z5KAEEpxoD6MxjxCqseWMkDu+
         xht56Oi4pzqIKJkNL3vzg+i8x3pe+6HpvUU5gD67mT4P4nE0LXY6bvdOr/YYQOJjHdGj
         2pdOHlKr8i+v89EFnRf6dyKl04cmp6NvJgRsy9hllRq7t/BeEWLH/cXQChnP8NvY4KTn
         1JRBPsu7k6Z5G2Dk0QKqVa8nMdpMh+n9af7C2SBTkPfrfbc1k6yBUtQ7T+FrJWqa6nqk
         C9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236296; x=1787841096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRJrBAJIIuvN/ZSCg19dnsWny7L4+vdYdyZCNWvV5qU=;
        b=ZTott1Ws1MxtRRi3a4liIWVuHxHZyBsbHUBvPn6hQ+H5kGaz99xWLhMy6Xbv359nng
         FnhgckC8z+EncSTaxWteKyy/CX/KFAimm3NvRY+ylyZ9HAjEP8UgiH0uzVZ85vxESMt+
         NFBhPUpDy5KssQcBRthxV4V7iYJfIXolFCDmyPMs8hHjtQxVdFN0ntsUUmyAFTEA1m7R
         L/3Re1tF96B85w38I0hrKUJR2cDl6auv4D0ef+LFTovRnXfwZkVCR379BJMnIQIgzIT+
         qgoSeIIKX5XDzS7E/mnCRahY0gTtOV0J3BKXB2VLHnibxbeRRL7mopxqyUBcTw4Sq1Pq
         dRlQ==
X-Gm-Message-State: AOJu0Yzct+1bmfZrVdYDuSRcMJmvu82jnzwf+6gMlKq1LIY8zLrbv7Nb
	7dT3FfuAclCPwr6Je0Te0bt4dVTPY8/rZvHB57QDI2XxYzTsXif+DVpnyw7XJM1xNq8ayI9fJKW
	AaqYDneHdxC8QSOOEYUiHaizfoxjFh6RwaeqIICvRmqFCrZ48M4JUfjdF1ICp3+W4q99t
X-Gm-Gg: AR+sD10AHZIdqis1RjhwChsnp9aRdfl8ihQMZ8BDsM2aNJqGcqbTlD2hqvtI2opBWa2
	4V6yLfc29enw13zfGSnsw3lrmWnRHAZuv2V5W4Bxpf/PHJ74I4bRxs8gSZhxoKyOBI1EdyNSXmD
	mtfoEoQYmQUVsiK6L1kHiddIAi+P505kR3Tm4WoszZLmRlFtmSIZ5M/dmWq3Fh3fduHMacRDNui
	i+CiYxAPlVQFnprcZ5AkpCjis5PwRPAsc6+q5F4SFw8ZT2FDnl4xZrcXxOc28YN1RJRvRsHM87c
	oH6IAbLwi0WFLJnJpYgrmohWzJDRVc5GXwr6jGl3EyuGtAZNlnnlG7Gfl2rt4FZWagHYX8qvPlk
	iXLisAAVxCcy8ZULE9tXGd6bVhlSJFWktmL2x
X-Received: by 2002:a05:620a:44d3:b0:932:df51:5172 with SMTP id af79cd13be357-9371e677565mr1114593385a.42.1787236296366;
        Thu, 20 Aug 2026 07:31:36 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:932:df51:5172 with SMTP id af79cd13be357-9371e677565mr1114587685a.42.1787236295917;
        Thu, 20 Aug 2026 07:31:35 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145c9d7sm15226618f8f.15.2026.08.20.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:31:34 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:01:01 +0530
Subject: [PATCH v2 4/4] soc: qcom: geni-se: Fix write to read-only firmware
 buffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-write-to-read-only-firmware-buffer-v2-4-7badcdc455fe@oss.qualcomm.com>
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787236268; l=3738;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=cfnpr8w4exTVb7D4hekpomYCJ2mAqjyh/p6qZiUEzJk=;
 b=KyncpvB/PyPrsZZTl1Cr+9096Z5a+RG7GUCCaD7GOs/CpdDTqqm/8/xeLfGtM95LL4CYCFGWU
 +XtcYWN3GSBDeSU3Nvuzj23sIFdhIxbDthGUJAqudI+DFaQrgRQsBho
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: -3RzuNKw0H-9TwPQmJtYRz2WmTHcge0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX+s4PzupJxhFO
 YH89fgLmNL5H/YFl+2iNvyB4D545Q6UraDd8XCeQSd244plIf1QDry4OaypV2ZTjWl8JFYtInfi
 ODFxh8CCLoxQn3cTjj/aGAtaKItitV4iJF3fXSYOcVS/dfdu3Ut3cZx0dQBCFbQsaQwSl8i7IBU
 Eiyx/JVFhApCbUVDDa4Cfx3D9ocI6AYD0eZIvv69On/3QDHqKdYNNQZ4zQ/f0n4nex4/Ff1kzwv
 db2aHVW5Ke5vNR1VQ2QtB3TfUY5Briem3l6QoGGUh/FDTCMme/bXcgcgGmDZWf+/8Tx1PRh0M9w
 9lzyxVeIQ/RQq1gUnOOyZMYXgc4S0ys/IPtsSIdY6qlvDuEnzhsVvJ2dMVfVxNu6G5QBT1ToV54
 3Xa5FViby2UCjD9rqULkgM7dTpkOuPyCRbI00GwF3yqMzBj4PKuAR/+ygL065f2HXrE5IbNPIbM
 i2P+TRkBkG76toI7sfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX/w8pR9qDBNc0
 70yrTIE1jnEJkxHT528ZJ3F2hmCTJkQGUSPaDt7FyHweNlhaGoLQseT9uV4EVOpqMHphaIY8Dcp
 vlAuz4m+vMbtt//NfwVIGJtAR1q5gGk=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a870fc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jfHSOdyuYKquJek64F8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -3RzuNKw0H-9TwPQmJtYRz2WmTHcge0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200109

geni_find_protocol_fw() casts fw->data to a non-const struct se_fw_hdr
pointer and writes back the rounded-up fw_size value:

        sefw->fw_size_in_items = cpu_to_le16(fw_size);

The firmware subsystem maps the firmware blob read-only. Writing through
the cast pointer causes a level-3 permission fault on AArch64 and
crashes the kernel during driver probe.

The write-back is no longer necessary: the previous commit propagates
the rounded size to the caller via fw_size_out. Remove the write-back
and make sefw (and the hdr pointer in the caller) const-correct.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 11ca8223fbcd..6ac2bdc16984 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1238,17 +1238,17 @@ EXPORT_SYMBOL_GPL(geni_se_resources_init);
  * controller. Validates the firmware size against the hardware PROG_RAM_DEPTH
  * read from SE_HW_PARAM_2.
  *
- * Return: pointer to a valid 'struct se_fw_hdr' if found, or NULL otherwise.
+ * Return: pointer to a valid 'const struct se_fw_hdr' if found, or NULL otherwise.
  */
-static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct firmware *fw,
-					       enum geni_se_protocol_type protocol,
-					       u32 *fw_size_out)
+static const struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct firmware *fw,
+						     enum geni_se_protocol_type protocol,
+						     u32 *fw_size_out)
 {
 	struct device *dev = se->dev;
 	const struct elf32_hdr *ehdr;
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr	*phdr;
-	struct se_fw_hdr *sefw;
+	const struct se_fw_hdr *sefw;
 	u32 fw_end, cfg_idx_end, cfg_val_end;
 	u32 prog_ram_depth;
 	u32 fw_size;
@@ -1290,7 +1290,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 		if (phdr->p_filesz < sizeof(struct se_fw_hdr))
 			continue;
 
-		sefw = (struct se_fw_hdr *)(fw->data + phdr->p_offset);
+		sefw = (const struct se_fw_hdr *)(fw->data + phdr->p_offset);
 		fw_size = le16_to_cpu(sefw->fw_size_in_items);
 
 		if (le32_to_cpu(sefw->magic) != SE_MAGIC_NUM || le32_to_cpu(sefw->version) != 1)
@@ -1299,10 +1299,8 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 		if (le16_to_cpu(sefw->serial_protocol) != protocol)
 			continue;
 
-		if (fw_size % 2 != 0) {
+		if (fw_size % 2 != 0)
 			fw_size++;
-			sefw->fw_size_in_items = cpu_to_le16(fw_size);
-		}
 
 		fw_end = le16_to_cpu(sefw->fw_offset) + fw_size * sizeof(u32);
 		cfg_idx_end = le16_to_cpu(sefw->cfg_idx_offset) +
@@ -1437,15 +1435,15 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 	const u8 *cfg_idx_arr;
 	u32 i, reg_value, fw_size_in_items;
 	int ret;
-	struct se_fw_hdr *hdr;
+	const struct se_fw_hdr *hdr;
 
 	hdr = geni_find_protocol_fw(se, fw, protocol, &fw_size_in_items);
 	if (!hdr)
 		return -EINVAL;
 
-	fw_data = (const u32 *)((u8 *)hdr + le16_to_cpu(hdr->fw_offset));
+	fw_data = (const u32 *)((const u8 *)hdr + le16_to_cpu(hdr->fw_offset));
 	cfg_idx_arr = (const u8 *)hdr + le16_to_cpu(hdr->cfg_idx_offset);
-	cfg_val_arr = (const u32 *)((u8 *)hdr + le16_to_cpu(hdr->cfg_val_offset));
+	cfg_val_arr = (const u32 *)((const u8 *)hdr + le16_to_cpu(hdr->cfg_val_offset));
 
 	ret = geni_icc_set_bw(se);
 	if (ret)

-- 
2.34.1

