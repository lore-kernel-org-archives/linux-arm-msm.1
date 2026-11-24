Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550512;
	b=FJ4Bn+XaQD/zgylp/kewxNZTsGLM3x+5NwezA9AKfQ7UsYMtS7s+inGudkmUPI8mlXM0
	 8aZLCsMsBdMGSVtbL08OaFOyZ32yRtITwvB8CSMT4YN1Ux0CCnroSreh3nQpvFHqZmZMl
	 6RBHTmfXzmDckcsSse8UktQf6tKml2t8suWcXE5XezDA/24gBdei28r2+Qfin2UiYAHNI
	 MKTWa0Gp5ukt4XUNgMqcNP69jSw0oWAfI174XZK5L3Gspc3oOxMIqfGUrwQG6xif4/6iY
	 dpVRnn9zi9zN/Vuo/1HTbaFV1Oh/iHWtSr2IaAyon7FxAYu0PBHJ3q3fNnNHZ5JWDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=;
	b=x9ouFGEeMR2OSMuTUytK5wxsaL70oei4Wixcvh4/9y274HHRsGwJBdosVXgxVxq1fyWS
	 1XVWQgXb+uEGi1MnGmrgzi6HW+1ICKY9qgVGbZHp9As1EQOcSRSEtWuEW8fKURYslvRxJ
	 nLtZjvy75Blx9odRaY3J34KC/uftbuduMCdHyiq/kEtE9kqsqoz8hDPv47D/QVmZo1jQk
	 /20Be5Tof1yzjSOZv6wK4bNtJB/6YnOwR444jUwtLbC61URNA3lC2q2ywL+IkUPEApjg5
	 B29jB1JubYZZ741ktW1nz1PSWl5IHD8b+6top+kJkzR8EM6UiSQV6Iuh1kbFF6AeXYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IL57Sml5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYTPDVn2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E1606A680
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9E1606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IL57Sml5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYTPDVn2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIZ0vF1652491
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=; b=IL57Sml5xfe62MdB
	iyqsS+cXKZEmhzpSy1p8TXZvotmSq94ioD3piMTLwelIU20Cd6xM76gTNH5LjpQ7
	Od5t1wWIZy62T5XVzXGZTsOPvw6d9CTSC3ghD2yONumAcl8JItAkUzUqc4//qvV2
	mCdcyvxugqMclUgUagSl8jgn7oqfowJatbYn3pQ8r/eQefe1KuAoEwumyjjJ0IWD
	k01FDJzwsNJ2LincnZ43ewVzm8Q9FFouz3sdW5HIpntJ+TtOf4VbZ1+s9heORZ9X
	Vsgzl3vAvy5NbGy8UOt3p2likBgzbYd/OO3wAZ/MbJSz6qkSeoeZxBL+dK7fDgsL
	quY7Dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so27471385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550510; x=1796155310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=;
        b=BYTPDVn2Gkhxl8e+rU5qshmiEnl29Lap7ArLPZ67M0cwauIqMe8NK3b6PSwOFgtB33
         7IJ+O8aYmTZsKj6uqRgpRXKzq38pdG0wmwVQGKlgUOb6hxHuB5Lu1hxfiRclDYry2av/
         bOF3Kzlbo25uNaESxFc0m3Zl2T7J3r2lr0lrWmhLBNbbopNDcAY0Js6Opq95sdyN9Mu3
         tbrJsMO6av+FJzdnVQTxebJf5wVdoMrMNW7GTem6BAt99Up9P0i/BDZ1eleJpEHI9zy9
         mPIpeZnk3Mc9juCt7RCWhP+hr9gEtdzRx15kh8pEoXV87BZcH61hi7kIvrrrp407SK1R
         qC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550510; x=1796155310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKqIC7ealqa677hvEeWqUpfh/YKS156X+QuCdhTxr+Q=;
        b=AzcPIrJ5RIieP4RpSykdYUoCne/8EBh/NvrdOHek/LwA+70xPK8hv9A3RSAdMV+AMp
         bcVFvzY0neCiQ/0NQAeWlREj/R+tb3AkOjk1yMCXV1VFWf1Xnb0SOfmeHbgSFd90LldQ
         IC6U4K7OQvnJ3XsKGfG37phJEgFTPCqSdyoQeqwVTD5OX2fkGqcNXTFtc76Rvza07Mgn
         E/CET/MnNb1rGKA4cuMCpD71/x/3pFjaSCBWaw0qsxYdPK8ltXM0HlSmkvIyCDRYUES8
         wYZqc6Kzuy2PoKY/mB9TEQHGmZH5JBBv/kJzp5RhbSYBY3TAdqFN2oy7D+EytI8Y85qR
         SLMQ==
X-Gm-Message-State: APuU4Z+89x5ndOHBtMfd3RGHYQlbGVSuKBLdTL24Nrp3IoU+srQsaWNa
	ljfeoIj19jCItTmojzac72XmMCB95ppBOTrhvH1XRpCnRHHRfEJAWGTSZkWde5jKUdETqb7/a7d
	DnsUOJWol5XmaC8rGAzX/PbOkkPaKN+G6SSSC3pO/GFBU+8tcwgRmT9mRMabbj0MdKyG5
X-Gm-Gg: AZFdTZeagD7JWD5NERHfp/LBtMOWO/IMlZCQbDwgDgNbPZZO0QhrQ3leQhF9H97It9R
	2rdgAZLf1pB59JNxxry/O3lBUjskmXX2BoTjDolysuPSbsHVNEn2Ml0GN3JPOxKeWlzh8ePHqla
	nkfAZFpJMKuY/QTNfzjBktavqnA6PR1tG1V8mwtQWhDazerIiuHF/7nBsRmsBxiYZ6xtNFapNTa
	BVMDloaSTw5+qasSNTpdJV69hbSi9LgWXZ2s0fLo7M2tjYMQ7yr4wyraT43199egxt6W+4YecOr
	SGr+grId5VLSvCZ1mOApTDcnpkFLiArG+xVh3aOpo628fiuOrXuJ8iiEinb7vFGJqt6rlFQVIxQ
	L1bohN3P8LsRViqHM/HsICY2DcbOTKLQXoKV8qf3G2uTxSXhKtwW7goJdF74EY2PZrPXhyugJxt
	0bHBWBW5Q=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2610568085a.1.1795550510103;
        Tue, 24 Nov 2026 12:01:50 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2610561785a.1.1795550509471;
        Tue, 24 Nov 2026 12:01:49 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:32 +0100
Subject: [PATCH RFC DNM 03/15] soc: qcom: smem: Add and export
 qcom_smem_get_serial_no()
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-3-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1977;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=nyFC46n7zm8p8bagrW2oxfhZgXokuRotVUD9oCP1whM=;
 b=w0CIr1nIKA69Yyrqw7p+nQ1Z8hEzyr/LwyMikdNGHTefPdGSDJ2hQo3CF4MueqFXzzJ6CvlWB
 OpwZTb7VxfZBznAuMXmSLI7eSQC0LI5m1Fr2DoL7AfQWUUmvUJqXYKd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXxuTJv5CssSYu
 GbwSIACSwHLrfxEOnMRMPd41tRn9u9WTaKFCoZkeigvEFQJ0AUbXN5w5SgBdA4a5vWVtJ7huF24
 PSWUAuqU9JXlSaYnr2zWC8v/mixeA1qVzFXUTegdjWwExHVH/Pyj3pfLMcDAyoCmQyRdAP6jy7L
 pfGMLzsEIvPxUk6i6KPXibr2MPD9+dyGMyGcZtIl9mb9ro76qOHVCFkC9283ZlwMRCja/SM7Jkc
 MAYEiQqm/ibXPNuO6sWcbWiByRjBFlfKm/1tW7rteJrxb5h9peoQbVogckuI9dQCfCKORA4MqGG
 izWbT2qApqR8mqdoV/xZNalLi4NA4z58Z24z7SROX/yTrKla1KhYnpEqAkNTTnU6V256rDabn5x
 yTw3CO+sDjHRQqVLeTdD+eTitp9YG7YoPlCFQOyy4N954rErGiH4qUO7qerKEEHNN9GItlUvqvQ
 NdTekCdr8sMXACmBPow==
X-Proofpoint-GUID: F3oXjUBb8Il2lcf7EPbs1ruH1MeWi9bB
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed2e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qAh8wiVjB6r_GXoMeusA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX5fw6x0VngCSc
 H09nohEckCAk1Qboto43U4aLQbsjJcNej8b93w+7ThUvXb2DsqcnLUjN2ixWT3A5ASnQ5qMUoPB
 ury3+/KGPDbsPOFKz7G6R3Nr/znbSWo=
X-Proofpoint-ORIG-GUID: F3oXjUBb8Il2lcf7EPbs1ruH1MeWi9bB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

The USB4 router expects that the OS programs a silicon-unique value as
part of its initialization flow. The most obvious choice for that is
the part's serial number.

Export a function to get the SN retrieved from SMEM.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c       | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 78b9d8b9229b94524b596c79cd0dbc26f05a8dee..45b39dd34a115fa2654603cc1b547d883e89a1fa 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -912,6 +912,28 @@ int qcom_smem_get_feature_code(u32 *code)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
 
+/**
+ * qcom_smem_get_serial_no() - return the unique serial number of the SoC
+ * @id: Pointer to where to store the serial number upon success.
+ *
+ * Look up serial number from HW/SW build ID and return it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_smem_get_serial_no(u32 *id)
+{
+	struct socinfo *info;
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	*id = __le32_to_cpu(info->serial_num);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_serial_no);
+
 static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
 {
 	struct smem_header *header;
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index 3249cbd2016b50950842e357ae4d591dc2a1ec55..294b49a629b9a739a457773b041775716ece238d 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -14,6 +14,7 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
 int qcom_smem_get_feature_code(u32 *code);
+int qcom_smem_get_serial_no(u32 *id);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 

-- 
2.55.0

