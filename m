Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614751;
	b=i0A+A+N8Pnn4IferhOR/G18jfKrUsonVCTFctOA3O6jUycqSLWbm+FWhvRzSY+YM1uWE
	 iK/0akzz4NkJIBSlMoFsv5jaiCUZID2Nwt3naXX3QoBw5I20DEXzwFl80GBLY12mzBHaJ
	 yTTIAQI9ALK9D7a4noOL/LBsvTjfEBx1S9gjXfcLIIQx57eSA020gN66synerYWS/t5iA
	 XEUZciZtCc8MpnhDvc5FGbtvb2VG95kiQAM/WWJW5JGXwSkDIjFBCZSKpAB8EanavzBCf
	 nqAnW2FZUwmzn9R2ozig8G/rHhxU63hVYUMlLDA2MlN1/R6OCq42ms02lNCWm/2pNcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k7gDZaefG4iconND3HqrkYzcgqHsf4fqONZiUVPv0pI=;
	b=1EgN1G8zOzEXj+CJM2DZY4ehk2duOdax0QCW+xfAHvWpixYCaJef/R8fCDuVuZksIHWy
	 hu9Okt0Ccu2ENzja7tEmt/mSV81uQfqPT8xaaf9Ys3pt6JBeCnRYCcQFWDVdXQ7N3OOX7
	 TZcvkVJlkqlSAYLPXFt/FWzYulHVYDjTwFMmOUQ2UGZMp/DNKnPOskLVWJyBzXnPH6/Qj
	 38d0PZhhv4wiApsNtlBgHplyOaKXBpP46/FN9lyIduw4c/P7OpcG0ZWC3zEsuI2SL/gKv
	 BPYhM7jwJetInjbF/i+LpXVeVLOkzWz0wYgtP55pJRDCCwIfMb/ObKhPNIdrqxBmOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DydXU9iV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkCFXdU3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B6160A3835
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B6160A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DydXU9iV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkCFXdU3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQsQ3086616
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7gDZaefG4iconND3HqrkYzcgqHsf4fqONZiUVPv0pI=; b=DydXU9iVTZF5r/x1
	poCMLFww5pjD/WB2YyJ7i0zAEGKmsvPmX9RG8TDpGUXH3FJwO7jkbzA44c08ay3t
	D5DxupEJrb/WfTgeHTuB/tTluQofBYcUWP54xT1jOhSrvgf29Y7bazEnEzZTbTnm
	5n2R2AVz6JypHKr509wxA6RG8A1d17MqQFwtssq9mdAX2G2Rq9yjug8SYFm65iDa
	dG9eQKIo6/yDMxPbI++68qoJ/twyVgzthJY005rJMqSujBZq1iv2VCgJbbuc0ahP
	ok5ASUkEvNlQD1oV8ccOsXwKGC3l0GZp9hJtc5h8f92cyuS9Io993JWebTzY2l9Y
	r5oENA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61abn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:19:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso699547685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614744; x=1794219544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7gDZaefG4iconND3HqrkYzcgqHsf4fqONZiUVPv0pI=;
        b=hkCFXdU3+17EfaDYDVoWBRE1z1yMgoFKbxu/ODJHvfl+eRuJd99jBirGHF/bw3yJqC
         txCv4ZLiv7OXFK4X5duLw25BnC7DipNQC3xaNlXQCyNFt9QedhZZflY5/DLmgkjSkgfw
         nt9wK2eaMm1kUzfzi9V3S/Wz82IapssxEH2OjvpUYmtxqMlRkEdnJDw2IwHqVFVCKSG9
         IB0Vx5YxkoeGuJSHTVq48N0ETcbrMbAh+/7LZp40SM1hXP+pHS7uc8C+F3i0WZbUJ9zV
         8N2pDF8nd5iCGbNi9jmG3SBHtux0wKZZO2/J6cpamwi8FRbAjD3L6nG8I4ePY+zw3BKs
         8hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614744; x=1794219544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7gDZaefG4iconND3HqrkYzcgqHsf4fqONZiUVPv0pI=;
        b=fz/wLetlOj96pNc7NtNMpgizuCzNqMzHegiZiT0DchTR6PSQqiE5JEfXpvjfhkZDKs
         GVB2QIzc3q/2fhk5sZDI98uouTorHY4gnxu1STtNHH81Vvcr6KAsTynEILAs6p6gsAoH
         BEkJQKIFcl3sdz2ryJaaPOLVp5Tn77pHJD39qtQBHix03V9OVffb2wmdPG80fwCssBQt
         lVtzrd2Lw+4nNk0DdNeDkHtkb5u3gJJnjHTSQzOQe+0BKZM/V59JqmR4YtxiQnj0R7ta
         WgfOpvKrxdZJVe9Xv5AYuzV0/0MAw4oRbdmOnKiILPbhZGuSLpgxl69AMgJ/T6uWWmq0
         n98A==
X-Gm-Message-State: AFq9FYKRMOU/xcxUkZnlMocY5DgT75/zcTSQKjVJ2h+q2wWBbaJERPSt
	IZXJ8M+2Vb6AH0ipWTnUpsBAdc8M/tni8I+aGLmNYcnCsVzI7u/datNmxwvg0tPGrnHrVjfjKAo
	vGictT4iGXrPwg5NgTQpYcwAlVkv6DIDYeHa1zrtuVKM5BEoBDfRUg2bYMP603xDqYat+
X-Gm-Gg: AYBFou2Sbc5il0n9PzWiq+TsHYDE1Xmwg9rH0IDF8GCfNQlaWAHUcdqfOhFF/CoyZS3
	TJO9aLI7Vvxq8aFkQFnnzvNhblWm/5xBQKaFklcDJC6R6UTg4s/PKVXHX0BOLGVfzRBCYP3klrv
	9Xp1MLO84SSwzwyeSNjddo3CVDsVvZmmrMH/UwQKOCO4q9uwrklW/vkNY01dBb4/EryKkUn+sSM
	zbwhbM0SWnqn1j4j6l4WvbUchFr8uoKafSJrv/ymlYIqJpm9PuaJA/UFICVDpHU/1sJN9bTL0HD
	Fni98tbgUFMFhj87PmYwbWo9PS7AWutwy2FlcrQvCDSGqp2PEDbXcbcwLQiD0M5X7HC4cO0czgF
	eSSUOOO3rkgPjio8Tv+ha/vzZiR8R2vwVRkF24srcgmIUAGcydCRBE05IV5/oUkv1mMCzauwqyG
	3wyQ==
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-944133d6c9bmr1944780485a.36.1793614743755;
        Mon, 02 Nov 2026 02:19:03 -0800 (PST)
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-944133d6c9bmr1944778485a.36.1793614743262;
        Mon, 02 Nov 2026 02:19:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:53 +0100
Subject: [PATCH v4 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-2-21fdbe876883@oss.qualcomm.com>
References: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
In-Reply-To: <20261102-qcom-scm-code-shrink-v4-0-21fdbe876883@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4865;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0j5Q0VNKognDq3Ym/+sWfpwUxNcv5ZyduclKhg2ROfU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GORSJoymhWGYLut8ejhxhpD2wQuNN203kU/w
 oVjiXweWZ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 w1IEEACAzmRaRadnmagaExCc8dEfN6mTMemRHQVdVbIaxjo5SGT8ywV7N92woy77P2zOFiz1Axi
 0ZiibeemG6Z5bmKRfsBN/GD3Y4c/NArC+0xBrNLOpOOtjnMCuM+K2zWa38VSQTXctZVELLChg+3
 8vyJ2pNl7XSXWFqfTbXTOkBhSJMZCWCESOQM542RpR8MvfgOG8hEyF36d6ppsAFX4lZnFKPh+UQ
 vhgrPqXiTKaTKMuOW3GYgpFGJ6bcwBFQ3yxcscUaJsZ42xfdzSFC6xNcJZTX6L9jtw4irR+7qZE
 1Uh+Kxy6DGiB5EuaJNnDkAi92Gx+qbCV1O3zDUHqiUL7IOQJk6a2fclVnllbxulylxLn8VZ3eOU
 w++X9Pyppou13n5EJaKA+UH1FbnIEY9Zg4k1gTqMk2aETOR/A2D5np/3QhyxfgSn9QKm9YTLuB9
 kfRQyxigDYdK/rjRF8MP/VhuYheL/6ebz54EZkSuRme2qWS0B/NDbFDKnf3haYyIHTz/95KvNUV
 cUnPJp/BkVGP3HPuej/9wRSCdB9/wM0wRxX/gsqB2eirlLm3EZuPvttH+uIzlKzRwmsrOqWnpr7
 aUYJb1G2C855KibDPbwsYJ3/pxYA0yu7gnLKYmvGkACTVyUW420RVm7dgvPKkgwKPctqMRiPXWG
 3KMVREV2Stts7NA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: tMSPKw9ZTfpnZY1p1PJtp4enqJM6b0r-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfXwIDS7NOjBiGA
 pkJjcwxhW0R3V+HHmMnWIQYTgyeYwNAvhSXOAaF/QvycbBxz+v0qoIbz+uYeiW2ASxpKhkmG19k
 YzkEiKObEUHPN8j4AdlgZyXZl76XLoI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86398 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lzBMFA2zsglRjAhb4b0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX/1vFyBZNwlQ6
 U0bcpNwN82tNyODyue4LpIU5X1ndwp7YdKbhGVI4Iy7cbkz8qIMeMpXsT97XRIGny6PdikChp3o
 ycEMAqRI7iNY+xIcUGfbN/edxbebqzbdQCjul/5m0JImyjW+FxAM04vTurkMtlA/4JpXSctwYBE
 nbqHl/G7jeIfvAPol/70UOMN8LIsu0lOkysbgCbnHSPcEn3fMvPzJVWYiEB0NtIbUKtQPtQy8gR
 tMcslmXm80CoPShMQG2rvEytHingCnFpJXE2Dh9BhGUDygrd8QJ4U3WdDibzuAkFnMjrwWOI1ES
 fwcfWYy+FhNmwo5MptI79oMOxb0EvCxYBQdKEQIkPDSLOEQSPjE9teTXi4f6rPvf59Iw91q3rau
 wQYC3vQbam+KI/++wZ7bs37rjbLeG+5jAqCwSVr4Ssg4NtRO+amizlqTQ3q/cKtiUvdjKFRVh/6
 rikPI/YtkXXAmZBeyKg==
X-Proofpoint-GUID: tMSPKw9ZTfpnZY1p1PJtp4enqJM6b0r-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020040

Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
whenever ownership is transferred) to replace open-coded
qcom_tzmem_free() calls and their associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 53 +++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75ab7c8387a5ad5f17bd35fdf3e518..2fad9607fb0d55c33893785ec0db602c4f9e6bdf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -614,10 +614,9 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 {
 	struct qcom_scm_res res;
 	phys_addr_t mdata_phys;
-	void *mdata_buf;
 	int ret;
 
-	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	void *mdata_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
 	if (!mdata_buf)
 		return -ENOMEM;
 
@@ -626,11 +625,10 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
 	if (ret < 0)
-		qcom_tzmem_free(mdata_buf);
-	else
-		ctx->ptr = mdata_buf;
+		return ret;
 
-	return ret ? : res.result[0];
+	ctx->ptr = no_free_ptr(mdata_buf);
+	return res.result[0];
 }
 
 static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
@@ -732,10 +730,11 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
-	void *output_rt_tzm;
 	int ret;
 
-	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	void *output_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								   *output_rt_size,
+								   GFP_KERNEL);
 	if (!output_rt_tzm)
 		return ERR_PTR(-ENOMEM);
 
@@ -755,20 +754,17 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
 	 * be of unresonable size.
 	 */
 	ret = qcom_scm_call(dev, &desc, &res);
-	if (!ret && res.result[2] > SZ_1G) {
-		ret = -E2BIG;
-		goto free_output_rt;
-	}
+	if (!ret && res.result[2] > SZ_1G)
+		return ERR_PTR(-E2BIG);
 
 	*output_rt_size = res.result[2];
 	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
-		ret = -EOVERFLOW;
+		return ERR_PTR(-EOVERFLOW);
 
-free_output_rt:
 	if (ret)
-		qcom_tzmem_free(output_rt_tzm);
+		return ERR_PTR(ret);
 
-	return ret ? ERR_PTR(ret) : output_rt_tzm;
+	return no_free_ptr(output_rt_tzm);
 }
 
 static void *qcom_scm_pas_get_rsc_table(struct device *dev,
@@ -778,8 +774,6 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 {
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
-	void *output_rt_tzm;
-	void *input_rt_tzm;
 	void *tbl_ptr;
 	int ret;
 
@@ -801,7 +795,9 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 		input_rt_size = sizeof(empty_rsc);
 	}
 
-	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+								  input_rt_size,
+								  GFP_KERNEL);
 	if (!input_rt_tzm) {
 		ret = -ENOMEM;
 		goto disable_scm_bw;
@@ -809,9 +805,9 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
-	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
-						     input_rt_tzm,
-						     input_rt_size, &size);
+	void *output_rt_tzm __free(qcom_tzmem) =
+		__qcom_scm_pas_get_rsc_table(dev, ctx->pas_id, input_rt_tzm,
+					     input_rt_size, &size);
 	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW) {
 		/* Try again with a page-aligned size requested by the TZ. */
 		size = PAGE_ALIGN(size);
@@ -822,7 +818,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	}
 	if (IS_ERR(output_rt_tzm)) {
 		ret = PTR_ERR(output_rt_tzm);
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
 	*output_rt_size = size;
@@ -830,21 +826,16 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	/* A zero-sized table means that TrustZone has no resource table. */
 	if (!size) {
 		tbl_ptr = NULL;
-		goto free_output_rt;
+		goto disable_scm_bw;
 	}
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
 	if (!tbl_ptr) {
-		qcom_tzmem_free(output_rt_tzm);
 		ret = -ENOMEM;
-		goto free_input_rt;
+		goto disable_scm_bw;
 	}
 
-free_output_rt:
-	qcom_tzmem_free(output_rt_tzm);
-
-free_input_rt:
-	qcom_tzmem_free(input_rt_tzm);
+	*output_rt_size = size;
 
 disable_scm_bw:
 	qcom_scm_bw_disable();

-- 
2.47.3

