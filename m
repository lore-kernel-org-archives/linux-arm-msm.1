Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614744;
	b=n/M+hd0fQzdm/yR7m+oxRduhjTF7LNG75lYMlfrGPeasbZ9IL6wtetZ7icLSWRdgqQtM
	 lufxZbDROLgGoKaE9JkKPVueOYQvAGPO6pEkr2OESVz58GUEM8Ge7sxI3Dz0EHXs1hyuC
	 gaQVk3H9qUds8BXz6uJOfiJIGd5DK43DPdx6vd9FeHAGvymel2KsrNj1bGyWOkDy1d7tf
	 ngvSHZISgT+dmutrHfrGcn1aKbaOwaKIG8lsvsepZwYv5x3V9VASH8EyyT4hVgYdCMQzT
	 8RQFCxYMNgfoQ0oAjbP/bOi1tEvfa+QEtpJtEXEqnnokMp3iADR4+lsy/BFHcVZJz8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
	b=AtoA9PTENpehKD//lmkrcH0jC9M1DraANQ5ldQsTFzoeE1LuYPdj1UKqhCUCe2TxPZ15
	 Mv6rxJPjxBHbwHZJVvsNIcuVgqzvAK8zrpLj07WzqOEQBIP1L9P8DjUcNEnmt67Xt2xIL
	 WkXfOevC+2WiqPArROoeA/HbWIr1gs7rZfjGaK1wv53xCxq+kLjdKfFDlAEjmk1N29mSd
	 y2XfHHB1IfqOS875X9VaXxfApXoJzTrorwo5JLa6/TEV/gm5XuQ7MS/irzS3yZLOt9NQz
	 yfz9skc8zdKT+PljczkGvTkRT2zw5vYSW8NjwSVrrMzBVLbvtgnZ66CjtfiVb/Lym3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQTXXxos;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epVwx3WP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0E60A3815
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF0E60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQTXXxos;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epVwx3WP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AP7O3086563
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=; b=OQTXXxosWnRZ+8HV
	D92T3JsKWJqxk6GwpYeEDK1sGVsqn3Vjs/sK1D4+0Ite+FlSGxy3xUVcDSGwu/fu
	+Y2HwCGUwRIZj/tTCwTXXvjEOGJKpBCt/hM1y+OTQLf5qqDahQaETvY2J1fYxW8K
	sAbrBAw97tC4jOX9ZPAxq1opMd8B/rUhkcprFavx7nVkV/jdrXfz7YlnZjJcQBrz
	6OqsR1t82zaEVxJczRWRO3NPiM87msiVnONHl5d19iL9IcDYppSIhOl5fwN2TYQe
	7+9wmyLqgvgpiFqkt2VFVl/77tjbd2iNN/PMqGEnWat8ynHZVZfcy2+2sHWfcmVU
	KhZLNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61abg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:19:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so243471885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614742; x=1794219542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=epVwx3WPKFCN29GWEoi4Y8R//YRH9CdoFdZjkeRrl1kgQf0klQPUiIYB6SmFHaNvBq
         ovpCn7hdgQu+BTiv0Eilh6HRiljDNZm/Q31AEBsEiZFVU64YpFWn4HDgpvNf6XQsCR1F
         ZlwEiER7VOHmI/VgZux9DEztBgmuuU35bmde7fzh+GI5dLAnLGnBfbrmlA3+z6vpaCBK
         hlDzJ7w18lCqy08i+BG2iyySA4wEbnD+7Hihp0JKi2r0S+i0wdKzwjgPq1CLT/EjIJ22
         PpN0/hj576kz6zje7O+soLHIUt0p3o2K1jdzf8Ae8lL8jHMe+QE+0WHZIrX/L4uKVxPH
         zRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614742; x=1794219542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=ONFSLlooGMO/H+icGQ6d5WTEzH5H7gUKDdbi7kPfhPkAfy4MweAy3/TI4FDN5WSv7N
         gahselYZPlm9IzwyY1Ldq1c56C9wafYKPwDOfPQ2Hq1H7r4zwSPzZ5JkIlWtdRxPfVJs
         cKCYEmWNuf4y8X1uxz7SVYRkJdXAaunuls/Mk5uvYOdzP9eW35jIpaVC7C5S7qpGNDtB
         dBLcDWhZfIe11By7W9JyibFMwr3cLRAnA2biyQDKMdsMLADH8eKpZTywwK/2oY6567Zk
         6A8jGNPUEO9cpfz0P3T1iNGNKWOy9RJY/fNXfJ0hSmkKCmOsDzxQnlz192/CJevqhVxS
         MquQ==
X-Gm-Message-State: AFq9FYLfwhWAa5rYctddpyT+POMOqNtr+W49b3li+PXUjNk3GDzvUK2Y
	KXZhqqgj8mLD5BGBJ3UOFDwv2/FA/4tZm22lMKw9++a5ZI5e9VhyaSxd1YHUqhJdUOLi76O+pCd
	+VFI9l2wN5eySiII7CCDCZksqAuvLxgx23EVIZ/3JKE46d8waL/GRgagWi5EBcONPQaSi
X-Gm-Gg: AYBFou0CEazlpiiG9VPcIUAsTNfFsnkmtWY5lib77BDwpXH1FepF+m+NhzT639RM8rm
	cJ/yKw/TBUgkCB7im7jmxTC2Gj0csjFHqTR6myN9vAvductz/+CL9c6fM3oHkSmsiJg2LQTuqLl
	3UdTg6W0jh7EH9bJUmBMKjAdxfmKjXjx1l3QiVPUiOCk0sooecR6SBAyYiUDBQ/iRWbNGJ72seP
	byNYoLnp8GdjlB8SROrTfpmpdSUb/37Vyk6NHYRMjrs/MDOqbmRLRbL1SumRYVsOU0VfvdjFf+J
	JoZJ+Jq/D8SpOh19oHSMiXpEkGfxoQyevaCA6yMQNE4rowu4ZnWTCI12GpZclHOMR0105oznMzJ
	tKPN6GI7zEEapj0qJgzlpIAb+Y173/9WDbVhQ4f43Hg2M4E/S++1fILJgw+NmEE9LBsorm7WIty
	AucA==
X-Received: by 2002:a05:620a:29c5:b0:93f:a7e:e0f0 with SMTP id af79cd13be357-944217ddfb9mr1461648785a.82.1793614741845;
        Mon, 02 Nov 2026 02:19:01 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:93f:a7e:e0f0 with SMTP id af79cd13be357-944217ddfb9mr1461645685a.82.1793614741324;
        Mon, 02 Nov 2026 02:19:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:52 +0100
Subject: [PATCH v4 1/4] firmware: qcom: tzmem: guard against IS_ERR() in
 the cleanup handler
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-1-21fdbe876883@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GORwqy4LnEmuymOUm2dwDXAAEEhJD02b4iFh
 /H3vtSRjUSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 wyiID/4troZ5VHc8X/zPxpUmMptQgLakn+XRYU+xwRfJ6N/MdOUlO37B8FYqOArzC26EXE98hU0
 rb5KfEbRlu1u6PdM+Rms6FFIpg94vNTKbave9QEm0haogIFnhZLa+VOXOzBto0pyTNQMqGNSicU
 VDZuqOaJhhHYFmz/YBA23cHvE0EvuMNX+O9XgS9x9nYI2JXGMUP9XAh3JHMVgD0m4APcJkGmsUo
 mUDaH0R61TsVcUP0uWp/4xTYKjBcuYhG4UWnxDmI0mVAJPFaM3a++VIyqiGt/uRbsHuyBYaaCHm
 Zo+6h2GKCYI93AaTQvoIEP0Mfh7wG/X/Trh0TNqfLIgvAJp53+cQxhBOAWAUSCKH3rQCy4qkgHb
 Ad7fUwqz5iVLQ1qm7UKK9mtg6qh/Trqem3pnciA+Ehobg/CNsIwm69MxmvJHhlawEbUbJ+l84lR
 SIVQPN/hHG3DLL033pe3HfeXYeZvnbhUYqeez/fFmiB1qOLcqwVIC4E4IbEtUDdr66j+uV2YeTE
 ePlqYQPWvIeOB6jnX2A3T4ztprby2M4/HVFzja23znR4rXM2SXZN8brc75ZW8nuiAO+ga9MFzJ1
 pws1kDjZDHyzGBdg2VgYSN+O8sTdL+1hFHVpVDPR4C/AjVS9UyXK4UVmnKKNV5BXUCq31n5yQ1i
 8WG31yFM6tTbMmg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 6HhUQuXCq6AdK7elrOKitMluS7_g_HUO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX/YazwysFAPxG
 cZHJ2Y0GDCkO6lxU1irxY0WJ9VD/SA/rcGVv4lq6cC3ghq4gjPX12lE8tTQmnC6e6wRZrYiZnXW
 3Qgn6fvLty2lwUFNzl8AIlxaNJrt5z8=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86396 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=PGwebHSm6yYtckILb5AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX7FJBmC3+NLmM
 Wgt6LTAuLYqbWikiamRWUsjErKzSCZI0/Wu+dg7H00W6NkXWHbE8Pb0SkYphEX6qm7y/bqV5te9
 Gn0XjnoWMij31BM3BGIpzFe31SHQREA05RMVRx6svqCNqDUoUbFmqerBww60Yvj+vb+5ajaEDUq
 04LtMyiSglyQteDbM4REeST5u1/uU9+lR4ouZV5R+SHwaNHMjWVBYNVvMt+91yqJWx5Iojks9g2
 U5raLBbYyS7Wifhb4OVLEQ9E0KbnUkqY7BbylB6BKrU8QH+Bu5D5I2alhLrPqcfiALOgxkcjY5m
 qiyQq3W6aD17QSfAZGGF/YUCOrw4cQcQ4gVtxRcWrhNTtovxGtEP9aqKbq72W7DwZGyhgk4vD46
 758GIx5qLGZnDLulwgLlRlEQrW4CtbqErMxR5PAyQ0/NYEeJUhPh+56DPY1ZTAPLiwEuTQg7Mat
 krCc6/0h0ikSLXYpf3w==
X-Proofpoint-GUID: 6HhUQuXCq6AdK7elrOKitMluS7_g_HUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020040

We currently only silently skip NULL-pointers in the cleanup handler for
tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
value so skip it too.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
 
-DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 

-- 
2.47.3

