Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561839;
	b=BQE8gVUEggEZKaZwGkGL80UOqIWshzlolZEQyxJ/TxXRY9jy/luUcf+5IeIqniETc/Ke
	 qdnWuAF40OCGMqjtpoln4NEZFU8pVYgNq56101PGfxcMa/OGCI3LnQ1JijWViyuSbI+ca
	 u+7wXKSsRBztAnLa24ilGMzoKF6NoMy3MRZFYOUrTLSHx80SLCGRXbDwpci3paEuZw2ui
	 cb0rcfpBh+TpiHSEosAvYmhFBfPj3dtj7dVVCRImyRqTAeK+1CEVxmFSeVVf7MFpvTHQN
	 VKAjsAVPoL86DMHqm2ze9Wr9szVjkhE8IoTPQ4XZKoYKZTotO5t7UrcpBooOno9eH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
	b=mDXgMAa/Rt38Mn+O99kQFqfJI47+Q898BbJFftiLhFq9CBQPzAPH5dOnGGr4W5ByW1C2
	 1xCZvlct8s70uuMaA+cUCzQ8hz6+IYn0wUfMeUZ5Sf5RQls9OeUOY2r786848bWSktvYc
	 UBEOreWXyF234hAY00eGM0Fb+m0OtJc04zf/7rKZoXM3bZO5G9mrb4Ktf2fc/4aBA6ajM
	 JwoSVS4wSVPq5K2dw7NV79ins2LbvtPAaVA688rs/Oqq/cg9/85bwLEANLYhxcDJJbxGE
	 x3PmYpYwwmqaFq3T281rUJh5F1m8NKe2ttwxZ2GbR+CXU2/zyOpic+zhLqrAniUswug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPkhEpS1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFdSXrag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07F606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A07F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPkhEpS1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFdSXrag
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V6od3652846
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=; b=ZPkhEpS1uetK6yjQ
	lvttE82layk9/4/5Qd1qwGY/KYHhBmNtM8Tbk00kFrJweTJtK+1kKB7y8Nr+m+dI
	dvn1szx8s498bqmiHNsrGdmGTmmogUCGuy7a+inMz6o+ucyg4oFmZ4FIc2iFqJ40
	pxqAaI2/JK3kg3bmDHUUL+sL5EXeUezkDYBQN1T5286PwmVTP8k8m5uOWZApe4Es
	f7/3sSfE/Xk77UFbf/B+rxXGcpqixYsYXC6uBQxfiN30zrf34mAdlO1h1/jswVU/
	kr+OgNaRm47l3NQUToL/vqJTfaADd1eqO1HswywJ5KyjhUEDDIHlOLX+r3Y3Ssdl
	uF34ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwacjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:23:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso17355885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794561837; x=1795166637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
        b=TFdSXragtz2RhjkNFy6cdtpP4q/+CBN1awTXquGFb9ElslzIAOl2rx8c8ffUc5ILRV
         53GMo6oYN+4Yem7lPO8Eh1RA4Pg1hMGUzrFnUGrQxovzRLhOSO9r+lm7zHkjXzYJUMxb
         j8xaSQE0vZSEhVyvEw6AxU7It2TDeopksRWL7p7DlctEe9eqw5KzKLezw3B7bPvZomZc
         mRbVioeXV1CuhqLo1ipYMB9s3X4G8/hcABCQlK7zIjVOeTd1ADNlcowbnRyBM5CbQOgR
         t7kB2Xjqr20RUIEJytO7KWMPBet4wgL4VWA0+vm17bwfnoUnMk9Bjj/xblcnTrbW7ria
         cXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561837; x=1795166637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
        b=dAnXJ+6q+lvYLeRK9b3AxDfgYiCfTQDrFZcyRt/f2TLC63pmODHFS/bp0SC/x5w8TU
         taCJ2b+7ypLxdqSpHClfeyEoMhAE6r6xInBpoCi+EUzymaMLv2ohzUFjpMx3sKGj3aKA
         WBlnidUp0t41ncxUXNrN6TqPOPAm8c3IZTiUQC53wyj4tiDmWMxR+VXpeij4Fl5gabDc
         7exQf7X3ju5j2RbT/QrZCWmJoBfdLypo6uWLR9qFEqSfk2ifztAeCPRpeeMJQ01y/UBJ
         Ij/LnX5BoIrgXfj58mzjA4Wk6+GB/qV+inFgNUzKbPSbr6AzZc+OuFsY39Ntx3pj7yQV
         GT6Q==
X-Forwarded-Encrypted: i=1; AL+hErF6mUWUFU7/I0KJw48Jo55lxdR+tHVv9ETUYyfWFcu/vn8BUt0dW1nlBGUQiWX0tOqlZ053bp7BnbNqHuRD@vger.kernel.org
X-Gm-Message-State: APuU4Z8u4xkUXdhLN8wjJhU47qb8Lk1PXIhuFMqKe88zpl0PW4ba89N2
	jpfV2X1URxG+Q0DtXmv2x3cwdCWqi0lV+vXXrB7G4odo31/4VZlukHL/uHEFRB8PasCYdhWkM3X
	23nyvhI4RNlu3ArAEiHFSLWVdmQKzpPiu6Frfug/YhCb2dRGxrj94I2S3SAOARW50UoOv
X-Gm-Gg: AYBFou0t6ZLRro2EneEsmbKetEiagrD6vrNVYS3TXya630c5202Ll7P9ItqsCy1WB3J
	pPhevnurg6o8wvmB3aMdgnUtfZJrb1zSHKiUJ01R50+60Iak2c7HnrUfhxMZbO4Aw54K7YriAL9
	k7e/T/N97srasZRdZcDpcahflhJU9iJdEkuqAmHalS2wDjaaxvOiGkI+XC0z4KOvYTCw5zoEJA7
	CUPitlE2M1JTM/NUimiqFzpSONhKjwXQDcAO+19iqlzlSG7+IpWUBWRGm4xk9XR7FOOqeydG5ft
	ox+zazuifYReihxyXZ0+1EZnaS1m1n43v50NXmUJcCShptMJNKDtCSoWN+0jm8U+vi33f7SCzaf
	TkcKF9cpptzuWygMyWlZ44mCBNAMp5CfBZ6AH/4LtBIDMVSfvLPQsDK1VbNKTqxsKlyqDLHo=
X-Received: by 2002:a05:620a:230c:20b0:945:c174:3d3 with SMTP id af79cd13be357-9494bc92906mr299601185a.5.1794561836475;
        Fri, 13 Nov 2026 01:23:56 -0800 (PST)
X-Received: by 2002:a05:620a:230c:20b0:945:c174:3d3 with SMTP id af79cd13be357-9494bc92906mr299599185a.5.1794561836026;
        Fri, 13 Nov 2026 01:23:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b427ddsm70563166b.43.2026.11.13.01.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:23:55 -0800 (PST)
Message-ID: <36d49272-f164-4bce-8203-622038d35e8c@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:23:52 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] interconnect: qcom: sdm845: Drop the bootloader
 vote on ALC
To: Michael Auer <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013202611.3070778-1-mick@yoxcu.de>
 <d58c1d15-49c3-4740-b24c-17b850b3ddf3@oss.qualcomm.com>
 <2f78c7a6-5955-4d21-8f61-b3199b493840@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f78c7a6-5955-4d21-8f61-b3199b493840@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6d72d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DHITo_NZqFMnFYMPA4wA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EiprhEi2-E3-Z8-KOL4O4uWeK6OLpKEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfXxcK0unoqBCIg
 xlAvRbWx5uq1Ye6tyYawBLwhL7juHafbNDO2Emk77Czg5TPW4mo6kHfx1PNrYOwoa8mV5N9pvn5
 Qv56v48RsIsZgiYZWlTrRk8/Aro1v0oTmhMQ8XYsyVo8hJou5CE+iiPh5ct6TcqMzNsScNLFraj
 KuhnuhAhcsRuSxQDOtzdHts8Ch315puGh3RuHutcbnPFBlnTn2x5K9CWYU3riz2OsIXJUdwZZcs
 0/AO0nKuiq8Xoj7fq8tLRJiPDKNpo2OBQgCLBkBnNP6Pr6JCZQMe65bRPpYsFkb26T7yzqujBNN
 p18CPG0aAUo36vMg6+Uq615eEKDj2HMCGeli0fBm03oMIRAsMRZnGvbAxg0gO4scN/PsxlzgMdM
 K8rZln5PnllRwIGhZfwNv87fYSNK0SSgOyHzihfoKG44OYE5MSDQj5J3gD/DSMoZef+NLuBYuPJ
 EiK1MU2jZfcGyVWqj+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfX+0AOX4/MVtCS
 MQbNw/jHxz1cDvyBL+/2Dr5IZSHHpDNV9fljvyO6LDJF898DS5Unmw4rv4yQ9UYTd1vz3LcbMly
 ImEfY1ZeYq89h2J+jSKikyGwwvJi7B8=
X-Proofpoint-GUID: EiprhEi2-E3-Z8-KOL4O4uWeK6OLpKEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130037

On 10/23/26 10:02 PM, Michael Auer wrote:
> On 10/19/26 2:22 PM, Konrad Dybcio wrote:
>> ALC essentially translates into "prevent DDR from sleeping to reduce
>> latency", I don't know what a good framework for that func would be,
>> but interconnect (even though it has the plumbing for BCMs) doesn't
>> seem like it.
> 
> Thanks, that explains why the vote is so expensive in suspend.
> 
> I don't really want to add a consumer API for that.
> I only want to get rid of the vote the bootloader leaves behind.

For a start, let's do something like:

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 0880a287b0c0..f9d51f3d586d 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -390,6 +390,46 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_commit);
 
+/*
+ * ALC is not modeled by any icc node, but the bootloader may leave it voted,
+ * which prevents the SoC from reaching CX collapse and AOSS shutdown.
+ */
+static void bcm_voter_clear_alc(struct bcm_voter *voter)
+{
+       struct tcs_cmd cmd;
+       u32 addr;
+       int ret;
+
+       addr = cmd_db_read_addr("ALC");
+       if (!addr)
+               return;
+
+       tcs_cmd_gen(&cmd, 12, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_AMC));
+
+       ret = rpmh_write(voter->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
+       if (ret) {
+               dev_err(voter->dev, "Error sending ALC AMC RPMH request (%d)\n", ret);
+               return;
+       }
+
+       tcs_cmd_gen(&cmd, 0, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_WAKE));
+
+       ret = rpmh_write(voter->dev, RPMH_WAKE_ONLY_STATE, &cmd, 1);
+       if (ret) {
+               dev_err(voter->dev, "Error sending ALC WAKE RPMH request (%d)\n", ret);
+               return;
+       }
+
+       tcs_cmd_gen(&cmd, 0, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_SLEEP));
+
+       ret = rpmh_write(voter->dev, RPMH_SLEEP_STATE, &cmd, 1);
+       if (ret)
+               dev_err(voter->dev, "Error sending ALC SLEEP RPMH request (%d)\n", ret);
+}
+
 static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
 {
        struct device_node *np = pdev->dev.of_node;
@@ -409,6 +449,8 @@ static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
        INIT_LIST_HEAD(&voter->commit_list);
        INIT_LIST_HEAD(&voter->ws_list);
 
+       bcm_voter_clear_alc(voter);
+
        mutex_lock(&bcm_voter_lock);
        list_add_tail(&voter->voter_node, &bcm_voters);
        mutex_unlock(&bcm_voter_lock);

Konrad
