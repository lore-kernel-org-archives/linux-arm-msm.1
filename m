Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386564;
	b=IkjYcsAJmILDIVc5eOs+M8Tut2/XBoBeedm7y4zhFM0Z75duXfHxfzSJ7DcsHwxVhYeu
	 5W9+DseMY3oh1+1IgKGFDc+NDcrxMANeQjMeJYTTPmsjHnEIOi3JE6JclE1Q10bOFsgey
	 50EKttR+S7Qadc1SIZZKWY9r0ZIg1rSb6VRfhR01VbUVd4VPtLWMh7jlwC/Fafwx5f+7K
	 G91AegxWB6Pv6BVVPVnIVjJBU08SWiCdsUnk+/MrFDLfGEF+yW+T10lKM07OqMX82zpac
	 HrbkkMo7RrUdbI3USuOKNYgjRgs3RGHIbw8U0WZl+ysxYEZIjurV2EufmFEhrpUUlvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386564;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=caKD8K2XUp1y25/Ss8VDsXr99ruFvls35VJEqEvKLcI=;
	b=EirWU9Nu7+l5ooo5SzQjoc6O9RZQ4ol5mtH63JIOTxbdm721zL69vPUJY8/CV3/HAh+M
	 RuAqo1yhIB0HmU35hlJHPhTOYm7HdigNDonrbZntMbbNHbgpoJ3K7bZkft3FQQY7C/+4j
	 5sbDHD73u8unqaTHpO3bL/VBiIXStpPxymAGDBBQcZQn0k1P1mHq4w/ZTvwOLM4nxaMO9
	 GNmPAU3YU29ZEbug9n3cD9mh6M6vK344CYs8BY2MosnAYjjyhvvZuiUJnsGxhJRDX7aLK
	 IkDkAsBbMJ/nKXp3NN8on/EteO0oQPOYxE4ZlTqJeBN+BFJWhLmiT6oRqa/8GvKSeqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rec6yN0e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVGM+QhR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADBB606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rec6yN0e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVGM+QhR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5K8Y91408970
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=caKD8K2XUp1y25/Ss8VDsX
	r99ruFvls35VJEqEvKLcI=; b=Rec6yN0e87PEOwVvEWwEvLsNMe8lpmhlpCqpvE
	ZZri7l9Z7cOkFM1U40I+NorpNHT1lsHPPlywK2Si0i1fTKpl3LfxNzxbwbjsMDlw
	1egtonUD4cg34wjkX8E2BNwadssXnvauhuflderm8ROGGMU9lmAxWqX5NzVgBvkx
	U8IbUmz16beFrTQWSO6E6JCrlb75YsM1qgzCOmxvIA4eiSk3LHRVuxslOQ5dgQEp
	NKmaU03U9aYDZiI4wqdZIzk3xpuwZRmLV5OOxho8IOgNH6sdrePgYbidja0wC/RE
	723tA6Ar5H//NuB8etpQaC6tEaUSsqLm5yr9kyLfQLqGB+hg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdh1wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:42:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6150624eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386563; x=1794991363; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=caKD8K2XUp1y25/Ss8VDsXr99ruFvls35VJEqEvKLcI=;
        b=dVGM+QhRUiROM+1IZ8Sku5VPqBtIMpxs878v9jhTH2oqA9cB7BZeVi5PhUpXQDM5UZ
         FTPb+El0GUCnCX76kENRZBqoz+vOBThmLzx1MDbvGULf7JZfYdPk19VFMAh8I9b2OQrC
         jyDoJb30FODx6hopjS0hJH7jTrTbk0lJo5dFzkrh/p1/SjzEfEt0wWYkxBo2vI4o3JUm
         AnRN4eB4EZlMd73JYYJhmFJNxI1r3c1dZRFExpOSkuCsQXLoq3OSvgZDxdyGC2Q7ON4v
         vTAxAjdgJTV+P7CtzFKR7FCkIMQWWOq1UUKBG67yIDoENhiRo42rD7SsbfPb+4XUOIq1
         pevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386563; x=1794991363;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=caKD8K2XUp1y25/Ss8VDsXr99ruFvls35VJEqEvKLcI=;
        b=F0vunHP9kGAcuJpdMvaHJsFX7voJLnn+OXxT/ouEtjmfNrv53W6zjwDB4kdW5qkxDe
         MCnF1wkkCJ67gMsgH2NP2crS9g4ulBemC80oyM3M4t3drOpI4YFMcTIyFTHzDG1ic+ma
         DMI4ounYxdCIyoPwb8mnbaAczPSyJIA+Ikfhaouy0GEtPa5g+Mc7JVohTY0bLDNbrynB
         0G9mgWNa+VaQ8hWF/urNicgkwNepZmRPZ+xAPMktshQ0PYtFSxNeDC/TSvJT3n/ervZ0
         lMAzRH1ba8EUajzRL5IJHa1BVDGLmX1Y9VHvXWiWNtS1JSDIT8kpOxRaU5XOTnSv3PQv
         zZEg==
X-Gm-Message-State: APuU4Z/J5Mfh7p2FOcYHwOYSY2Fus9TE+cxJ3jeWq9Y15HNbcGaMsBfa
	kWU92e+Fbj1WRFuHGb7td3QGlpNslCZmbBRhjaE+qFGKa3oJkQQBJ7/bZnbGswRorsOr3BC5U8/
	YAOcPAr16aXHY1eR9JECQOlShht0MU48PZMssuDLLPtCH0EuCrrwMXV/HHjTcjJNtKEvC
X-Gm-Gg: AYBFou3oEF0TUgX7soX3C+Fus32K7jn4BJaEokJNi2ASl+jaE/eKgT12C6Gvj3gC6J/
	s24sps24tFc6zDHOm+TUI+rsg5E5WmUY12aeW6cqn0oxQVoZZyprOtCUwx8NOXSRoeUBstj+bZ3
	lv8sKxKuUJbvgCUY+3rcYnBaoK2oMUEB5BncpdaX0TMb8dcbRHjIZNIrENygylRIS/wME/PYlAS
	RUBghdxQZSNiIfjUDYbQrs8oAqOBUqnCk/4Z70fT5gL/gaCtVuhOkpNpH+n2jzN+dYm2fPF59L6
	0D58TP7hkG9yjyHr4s6eCsXDn96Iv51DBKRxwkEerWtx6F6mvlJSAscG9LU1WqNctUDWFw4cOuL
	9q+51G6CrTb+NLuFx4ev0roa3dNTiwmPizuNBn2NLQJQcd8JOHBQiAndy4edF9gpx1xs=
X-Received: by 2002:a05:693c:87d6:10b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37685c7a8fcmr2405503eec.12.1794386562542;
        Wed, 11 Nov 2026 00:42:42 -0800 (PST)
X-Received: by 2002:a05:693c:87d6:10b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37685c7a8fcmr2405472eec.12.1794386561715;
        Wed, 11 Nov 2026 00:42:41 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm5935916eec.1.2026.11.11.00.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:42:40 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:12:01 +0530
Subject: [PATCH] thermal: qcom-spmi-adc-tm5-gen3: move hardirq actions into
 threaded handler
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
Message-Id: <20261111-adctm5_gen3_hardirq_removal-v1-1-536ed503396c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFgq9GoC/yXMQQqDMBBA0avIrBswak3pVYqEaTLVkRp1oiKId
 2/a/t3b/AMiCVOEe3aA0MaRx5CgLxm4DkNLin0yFHlR65RC75bhalsKpe1QPMtshYZxw7eqaoN
 VadDcSEM6TEIv3n/3R/N3XJ89ueW7hPP8AHePloF/AAAA
X-Change-ID: 20261111-adctm5_gen3_hardirq_removal-467a437a78e1
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794386555; l=4621;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/VgbWEVvLV7IIi9813+uAXJpHlnNKj3SGal/MqgZqao=;
 b=S4MejmbHBPlwKkgHBsgY4SsrhFgMBa8twu+tU/QhLpmkMaPUbWccTZbnI2mTpRdNoVPH9NOty
 qp4XEeFA+RzDTRu4kChTK/0pRdftRwBJyU0ddQASJPKr2X5Rfb7IZAZ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af42a83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zlfbmXi6rwQ6R9OsHyEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 7ZVhpTlqe56cU_7k0Ov92aMAMPWTKT6K
X-Proofpoint-GUID: 7ZVhpTlqe56cU_7k0Ov92aMAMPWTKT6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXz0FkLJkz2+oC
 ABBMNqxXGvIiBnRH/fO3tS89W24pGAHNuXkX35ODPdK448i+IoQFt6kai1f/jS7Dal4nnty/EWg
 /h3cL1lAqjW49BwoiNSiiV1kltmv8iVF1KlJvi+p8kCKWEFDO9klg5DC434WdoU6qkbWRKvkZzI
 wL/lchPJEHJziI4B2TItYU6hzPKVT9vThhMSa7souO2syh7lnJMS1rU7lFvHXMwepWXfcwoUbMu
 16FaEZABA3xnZpPZYYCGb9Wir6eJR07Yo25cKcsZYSBoxinX18gQV9ZyZQz2LlWFmUYvVaQx5lt
 T5oJrop50OYLtuMEwU/PAVynPsLoJhvyBkHmxEGW5+VPNbwGoyjDx+1473bophkeK8LL1QzP3LC
 aZoxjVcpNOD6+3/pLDImMG+ThNpaHjA2v8RPYZSSTXqHvj4rOZV4l7QdHOpwjo7ZAjViy5kc8Yy
 XOQlPpxVlPIAhUTgF2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX5Zbdf3JyATVw
 +2WLeLST6yEbenyQ2L1hLhHDQxuCQ4aO+p27DOCBg5wWYjWUHIr2SUCu3lSJr1FGYz6lnIJsRqN
 KdUU+IgO7PwklmrFJot7yQNDkbVDXxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

adc_tm5_probe() registers the ADC_TM interrupt with both a primary
handler and thread function (adctm5_gen3_isr/adctm5_gen3_isr_thread)
with IRQF_ONESHOT. The primary handler calls adc5_gen3_read(), which
takes the SPMI regmap's lock (a regular, non-raw spinlock) from hardirq
context. With CONFIG_PROVE_LOCKING enabled, this leads to a warning
about an attempt to take a lock in an invalid wait context:

  swapper/0/0 is trying to lock:
  ffff000b67201018
  (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
  regmap_lock_spinlock+0x20/0x40
  other info that might help us debug this:
  context-{2:2}
  locks held by swapper/0/0: 0, last CPU#0
  stack backtrace:

  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc1 #1 PREEMPT(full)

  Call trace:
  check_wait_context.isra.0+0x2d8/0x380
  __lock_acquire+0x2ec/0x840
  lock_acquire.part.0+0xe0/0x250
  lock_acquire+0x8c/0x1e0
  _raw_spin_lock_irqsave+0x6c/0xd8
  regmap_lock_spinlock+0x20/0x40
  regmap_raw_read+0x88/0x328
  regmap_bulk_read+0x10c/0x340
  adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
  adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]

There is no requirement for any of the work done in the primary handler
to run in hardirq context. Drop the primary handler and move all the
actions in it to the threaded handler, which removes the invalid wait
context warning.

Reported-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com/
Fixes: 948ee3a74f35 ("thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring")
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 41 +++++++--------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
index 910b241fa94d..996bfcfcac35 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
@@ -73,58 +73,38 @@ static int get_sdam_from_irq(struct adc_tm5_gen3_chip *adc_tm5, int irq)
 	return -ENOENT;
 }
 
-static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
+static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
 {
 	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
-	int ret, sdam_num;
+	int sdam_index, ret;
 	u8 tm_status[2];
 	u8 status, val;
 
-	sdam_num = get_sdam_from_irq(adc_tm5, irq);
-	if (sdam_num < 0)
+	sdam_index = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_index < 0)
 		return IRQ_NONE;
 
-	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_STATUS1,
 			     &status, sizeof(status));
 	if (ret)
 		return IRQ_NONE;
 
 	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
 		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
-		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
+		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
 				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
 		return IRQ_HANDLED;
 	}
 
-	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
-			     tm_status, sizeof(tm_status));
-	if (ret)
-		return IRQ_NONE;
-
-	if (tm_status[0] || tm_status[1])
-		return IRQ_WAKE_THREAD;
-
-	return IRQ_NONE;
-}
-
-static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
-{
-	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
-	u8 tm_status[2];
-	int sdam_index;
-
-	sdam_index = get_sdam_from_irq(adc_tm5, irq);
-	if (sdam_index < 0)
-		return IRQ_NONE;
-
 	scoped_guard(adc5_gen3, adc_tm5) {
-		int ret;
-
 		ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
 				     tm_status, sizeof(tm_status));
 		if (ret)
 			return IRQ_NONE;
 
+		if (!(tm_status[0] || tm_status[1]))
+			return IRQ_NONE;
+
 		ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
 					     ADC5_GEN3_TM_HIGH_STS_CLR, tm_status,
 					     sizeof(tm_status));
@@ -405,8 +385,7 @@ static int adc_tm5_probe(struct auxiliary_device *aux_dev,
 
 		ret = devm_request_threaded_irq(dev,
 						adc_tm5->dev_data->base[i].irq,
-						adctm5_gen3_isr,
-						adctm5_gen3_isr_thread,
+						NULL, adctm5_gen3_isr_thread,
 						irq_flags,
 						adc_tm5->dev_data->base[i].irq_name,
 						adc_tm5);

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261111-adctm5_gen3_hardirq_removal-467a437a78e1

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

