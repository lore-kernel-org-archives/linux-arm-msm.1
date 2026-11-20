Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145301;
	b=SB6tc6AwJBauBC9+gQpHBNEjltur3HJiUxLra6mv5XbMW4+O8gKziL2CgDbFETtNviny
	 BcdN8CmgvMq+VQjVuqIh7ZEFTqbteXcMM8JJ7rxv9grkxrqDgZK+LTFSyAZsSXbFp4IiD
	 CWwBmpzm2SZXNd42EnYhJSc0JMbkl/GLkqVOACmm9Dbis0W0tzZS4C7Jc7HC7C1a9r7/N
	 pqRnuuPXXsjfwiyB4Pg66bvobo2vTGsTk9suNo9uek5RlXfBMfs8nY5cmy2bVWfBf586P
	 pbYe580QflxGg2EH+GMR7r0YHgon/5eBxAmrwBpNoDnoXEiSC7GzWfYH92focGndE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
	b=FoOAGn2/LDAbzJjhY7fbSlEchGJaYj6TZaUB+1IRUSBBOqcAVpL1/adcA6vXrIrb80tU
	 7neuxSZ43B6qMjxsFCrK/TuPOh8AlPDb8y2RxTrMdqNB+Tq2fGfH+KU7QeXHBHatLdtmg
	 od+xnonX1AMVfaO/BSCEGCxcAnThsWC06tjgxsZR7oH/8TcwagU/cloELQLWForhTFVMf
	 CakLlkbnrysJrW5ArKrVzYlCuuaZYcwTWWoqSIDt2L3y71NN2oHvcNphrYEImkx/GUBzD
	 oFtn1o6IQZxM0D5tgTQxt8SlmioGHYFYhR32LCbdktGpg0sZ9bHOHTg9VAD2RyY74zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke7jBJV9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF021606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF021606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BGkuzeGO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke7jBJV9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G7Lg3295121
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=; b=BGkuzeGOJ3aM3hwZ
	bMax1U/qh4OrNonsZa52DOpUwDiS1t3VpeR8JvoNiWOXhCOQUg0q9nUjsxv/C9Fh
	mTvn8YfTUTN3yoF+CY6vHX2K5+6z38Yde0lz1amsDtDO4EkCVjupsiWeOvZvEcfX
	ISF4KCSn/UtsUAYb0VlMB4eyaUaQZ5AtY69/4tio0KsaJOWpWa48sr3DPYPLNzNi
	ChH5eY1tPn+mw5wfvVZ8jgjTSJAGCj/0n3AKxXBIz2oiWzbsGrS95+ace9st0I2M
	4/soKmdvhGBnm1uAX/LWElGFAZz/wjUzSoUdzRuF6OBzsTR24UPFa3US2YFNRBK/
	YUADDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghmk95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b427e5a37dso41174a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 19:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145299; x=1795750099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=ke7jBJV9zxnG7tz/V5r+gnekEmRmcXcbmiJCxBJGNzD5HerwfaykvA+voMww6Dn7aT
         McTgDgkEI+YeSxYITvvm1lJbWbKp013gtWHZ8hqfcpN0CwB1PMIFJ2GaS/QqiTqsvFY9
         bAmiBCDbPRHTIDJ1I4rMXbaj9et/7Se9PWtQxi+i5XXJCWBwakSIEkYIUDidj5v9jnxj
         r0HUyj9Wj54j18jzbZSY9NiWrYAVOPGZZ78FipUFUqQUrE5t9++VldFdaIipIzQzuVpq
         MP/Z0B8mZ+vonau8ABNBA2WibONeUNEvaPCwzk4NKgFpABSHix4Xv16IHt3Tpa1IGksY
         jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145299; x=1795750099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGWP4K7gSyR4882ro341W5z3n7kWbxEYoL3WuUhi5sU=;
        b=T5XLKWRyzmVAfudeIJip134qGtc1UbRSwM1sUoy+bRS6a/VWxd0TWxA2qOXUttqFs8
         r56KETYFX1v9RRfRZ17FTk4p+NpsJQ4KmLGc6caeklpQr3R2LQdTUtJKCgL0Cvqc9bcs
         b8Be4VoeiCm1q6ID/NAiUTAVTrS7JdRxA8Dc0xwGH9I5p4LVJ7HYW45I2qIiJShoAQwl
         JWP1d+ytIkBBwz0fDMcWWWyM8nlqYwyWn7BVnf8+KERr+W3eyA7H0ZYd8lhfPXQr+NFr
         7FGN0F7qN6wwKFANoLdbAsrbRR6bkPvWxGLdHpn4i0pN0k1kn/AxB6wvZ2YobLMoEt6s
         45HQ==
X-Forwarded-Encrypted: i=1; AL+hErH2q9BRkVFYdmr7SoJXwZFkQTUGO5OmWCMYXwlJ0nxbhd8if6kRTlZSPlQq5dIoTT8F78ijSsFPPCEscxo8@vger.kernel.org
X-Gm-Message-State: APuU4Z+UGcXVKB+UeMgiVQMayCiDX/16+qvCskE0Z9TrDMXGDZVIE6Wf
	MO84XRscChIuPveNIOU8zkF1+bSuVW7RsI8aQw9fEuOAsXy7QQwd10lTe31SqiASfmeMn5BuKYo
	6Dsdj9C1rNw7LMa9CmkskENPI5XmQlLDeVg7TrZ3rpKnZT6RK0HqaZZQGz/Uw0ivZhQZi
X-Gm-Gg: AZFdTZcsWe8EMvPSUeLcpwccIn3+zKtfLux939h8FMqCyN6J3Frym11/sMU+MulFIT1
	NKbfHaeT1ZXxS8W3PaLYkXCWUutXzqSsIH9alboLpy2t/dngCu06hlAjsEAUB0MsWqccL5bITwK
	QFAoktwxVKVc5b9WP5I3Fmu3+SWK4XgUF62czB+YobeuIUmFV9tZ8xJvjcApZ4GX1bQNpNnb2X+
	EZVLRwIsc0IXkhUtTKzM0vExGaJxKZtuVm4XctykwlzRh0AHQVc9IKGyEgJzxkVq0yP7SEjKd8+
	vHO5jlmVMw/QajHlP+qiCox77g4xO6Oy5T2gbUObf3NN+sv1Vi38kcAbaD+WNvUJ+kkOVM0H5Zi
	hj2J2DJitg4G7iKRLsCBBQ/yAJTis2KP3Kdgubv4c1UX4hIjF8f6Wt5HmDL2Jw8kY1sAO2Z5NOY
	E/HQNQHwZhynjDahIN96EtcuvtSsDvxt57+Cg=
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222874a91.29.1795145299300;
        Thu, 19 Nov 2026 19:28:19 -0800 (PST)
X-Received: by 2002:a17:90b:1a90:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b41c92ce29mr1222859a91.29.1795145298821;
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:18 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:24 +0800
Subject: [PATCH v24 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-5-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uwbtQr5CO9y4m2VKIS5xp7McWK7MGYHbpK99F1KNat4=;
 b=SLkUvEcl7lYrBTAQnWJAgtuq8pF0GvPrnlMCcAOC5CGloPzizcu9FlAXBO83peJqAz5ZVR2RT
 RpydEuqrPC1D/0d4Dg8ktxut2A2fNeKKBSaptBEH3qUiFHJZBUew0P/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX6IpqkjZhMVv+
 vKQsOu2V08zMc0RGY3XzR1QKpVrk8DXyd+XssRtHlgweVR10wGZEF+53cgFamF+7eemP88trg6W
 yjCqiuOgb9cvPMxvOQ2MsSFBINIIjZVu8rgpCuO+9wBkxSIDXwGrg5jX/IEhdwyBNMkOhmHFfTZ
 VtjGBC4f+/lGnvwTfikY7h3iJ8jJ91FzE9tQ9nbYFizjVB274zXFV4f3k/CuQmVYgrUyqKyevXR
 TO4Fr5f1Tg6gfax4UYMAxoPB82rg2FLeS57AF+b8DWlGNoRDHunZiMyOkCXZUII50dDR7Qezpzm
 olsfJ58+9Xf+ROydc8LAhuWD5tZCK7yPgtuVKZOG2EP1/ZTVaEKbc/y9Q7vv6pSiNfwC87zzahM
 Y0NJO5YFsuWPRuc7/VJ9FlPdyK+MkQ==
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6affbe54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 684HG1oaWN4KacZm8BHkp_6Xv4cBbQMd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX12Mu0SHR7Hv2
 ZBr3TqDrJe9uJ24bV43eWdXdc3EWybBZ2UfKO9Mce6yGVd3r27OQZuQ0n98K6SmVLTNWK9dyIBw
 f70MX9u0UDvv+meUAaWiMi4R855V9cE=
X-Proofpoint-ORIG-GUID: 684HG1oaWN4KacZm8BHkp_6Xv4cBbQMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611200013

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ba6a686828d7..308762194e5d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index e94bd74e7c08..6fc0b136bc05 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -476,6 +476,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

