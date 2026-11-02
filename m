Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614750;
	b=Lce79wji7PckbkNH+C7yF7igPGX+rSO8+a+ybZT/m/nue6GA/7XMsbT97hq9HXggG2kZ
	 7Ps17EoeDsyEkvvTO/ytoSA9G4FBP9CU8qHvguoLyC5nGM7tw0+OCVIYHOPDtklqiVDpi
	 PuASgAeOeylhFbMftTjrwRYx+af8+ejjJAi0yNam1vWISE0MwCZx0b44oKw+RWREpw3/0
	 ee056j10H6sCvFUxjimupkuruZEoCIynzZMMxMHVQkPSLBJO9Jk6QPhPYNvlkiaVpxcVH
	 P8UYckMJHJ/uaINXRw6f/gKHsmSkfDezWY38MGZUY7B4t2MQB1V8lKOKIEcqEk4hPeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=;
	b=YqMLex/2gEEGdh94jpUkvnh2hu9T6Z+SI2VLoYtDa3yEoD8X6bioHTdQ4vJxFgX/CUkA
	 nGl50DoVpY1krD90zZ+KYyejBpVIc7cJWbdYn1OPV1B7HH7zAE0N/sKo/AbtKc4XZSywf
	 OnOHVBboG799lsXxmwpSEi/pAvg7T1M+BQromfGyE48GAWKLVWZebOk7g1nx9FZuTGDSl
	 xaNBHUC3V4OPCGoel2Wt2SXXKE6uaVkbsMuOnYaJzl5VpsdTkHFQanYZqfYUBtZWx8jsV
	 0RR0lyWYFD6fS0va0duxgG4j7KcSFfLF+pa3TRi7DsVugqTGfp5lzMm1VDRljfMRjUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSIKFOcV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFSUsd9f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21C60A5BD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B21C60A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSIKFOcV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFSUsd9f
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xdt3402423
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=; b=LSIKFOcVDhUFhFMI
	n85hxlOArubogdlY8kBs7n2ySka0qSIx1AiPrh65og2URdLqVxH7hpi08NyqwJQI
	AFdOr5j3Cay1m4VOjAIdZEFjwzdsff3YdogJZVkCO8aNApQGxmq+jQBEwsidNJBO
	pEXQGJ7lgwy+RF0N8ACLLGdjyHyKIHMOz1lyMyLT27YersKaGvZv+o6MJb/6F+l8
	oHRg5QAi+SHBEWMlS07rGCuFh5xGn9ETDO3HqdILP5IOKJz2gdOZ49vv2HUHvv2F
	78FCyI0WciTfASgNK0TNbadnGacAmvXnCb7I90UezYUakN7y2ax78p6owJqgsdUk
	ItCArQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8md5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:19:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso474043385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614748; x=1794219548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=;
        b=FFSUsd9f/ddb1CXLDeWjIAA8GvtJNyh0J2ylXL+AJ+hLw+9KDnEY/nX+mAx5Qee1fk
         /zq0wOa/GUExUOP/zN7HpsjMeJT5+AHepPau8hQIuuZXoJByaZE7JGQoDzsBxkcDM0Gd
         BRQVU2R3r/iv+ahfcnYWYNPFvS4GJMH5xZ/BhkHdSVConbF2Sf8eE9w5sVH7kLQcrTyf
         jdN9vRQ4urV8QK3ryfN++dMaEzsrimTP8nr2jOP++hOPAcaK1AnFL8gK/g3bGM4Tv+Z5
         zO+ZdfjiCGoDdr9otu6NUDoTZAa6bVIjvq+CDq+IDM8GbA4K8em6LKUxTwuvhocyUoQS
         1nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614748; x=1794219548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUXYM93OqwKoARtQdQ1MwTlyicpsnPhwLruheKeeCho=;
        b=1yBJGUbFL8xuKwJl4jQbKD1sJPpJcuFJpM8Cg0F0aBnM1ZERAL+W3McT9tdeMrMRWH
         6VW4uH52n0dq9iZMFWF7pMA7C73xrPlprkoO8sWBUwBKQK+BJId7kp5iIRninNEmWI9f
         ur7XrujOaqelQ0S1S+LDihvTc+48QKL0GVo9ZlYqwpUj0blKt+qZurjyp8Ss9vSYQ+sZ
         u967w1Hf8p/HjmYs0e7km/itOZkpYMhNYRDoeWgbC+PoK600uxwpc7+m7qFH8hqefvQG
         JyLwLZ3reskdW3FQB7sVfILWSjD3eLZg2flZtZ/ydQuBLGR77l1n7R+ZTYeVRXcGC5DH
         a4xA==
X-Gm-Message-State: AFq9FYIj+cpC8JhrOv6Fwj3Igzhr/xYHSZl+CLDLYxAFH4Z4xLOQt3BN
	uHmHr17s0ANbZI2xxXh4QyHLYP27MPLP5beN/bSj2s5wCBzQPAxVX+vRfeTqlAq79Wi/3cIUkk8
	FCm/ESDDqMos/WtPED4tUiOUsauQSBFBoqhngl8RouqxIPs7eEXgzRj+0PQaJEyU2vE97
X-Gm-Gg: AYBFou0ha3Y3xMLhnx4dqGlinqPYqHU3vNd41er2cdc+yC1DvT7pmzE+qIDCcx4rsO4
	pnbIxA7l0A27gHrnhrbvazJDkK1SEMEeAVQj6cp6PEx1+fjCrzmWFZqTNAz8C7jrAPJpq1kZNnI
	5+hp1U/I3LNg0CrkQglYFmKdvJ2g9J5nkJWDSNcWpaVhfeWJSvBcyQsVxghJMJBfpVj0QOijCVz
	bCHVGvezSTs4FLey4YFIJfpN4quEgC3ogf51LJzgiThlIJYSWxB6wC5pEI6u0JUWfDu8tYM3k25
	pt6TRy1UDFO+mg873omI+VTwy1bGSoj5XGdrn9C984qqLirDMPNVa7g/eS8yQnWfmB7U20N4kNb
	2V5n0DmQJlLNu7oxQzGTrzhxAkNHKRZsKoIER8o7Rpw7dawxVk8FuC0bvtGlJ6z/8WrHfu5EGsc
	HYoA==
X-Received: by 2002:a05:620a:4509:b0:93e:85a5:226f with SMTP id af79cd13be357-9442180d5cfmr1646706185a.63.1793614747636;
        Mon, 02 Nov 2026 02:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:93e:85a5:226f with SMTP id af79cd13be357-9442180d5cfmr1646702485a.63.1793614746966;
        Mon, 02 Nov 2026 02:19:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm334530045e9.7.2026.11.02.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:19:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:18:55 +0100
Subject: [PATCH v4 4/4] firmware: qcom: scm: introduce qcom_scm_bw class
 for bandwidth management
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
Message-Id: <20261102-qcom-scm-code-shrink-v4-4-21fdbe876883@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4633;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+3lajlbu8ozVhIJLWbDtJUWTidf6wZo3cZqU8xT1J3g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GORB82yVG5+ykQEh72GlvJn5IIy/+kXclXUr
 JcPX9dhpVSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhjkQAKCRAFnS7L/zaE
 w/oPD/9oukNGaFDvCjzPzak1b08+FzenmRijWRWslZE/oW0dKAV2HxBBvAK7SY27u+50VoYcBYa
 BnfPDlx/D/p2CpW5U4aVO/+pV84CIpMLT5bb7PQBYt3y1OwE7xpvuEmcHfIlv9QRa4qjpRpgKy1
 AO4PV0IEaIxOFhJlio4ibOTjzSmtdReKb/k6N0IKFFBKB4u1aXq3T+XDtreNAdVIiP0iX/baHZS
 xNoy72p9io94eny/czTBHhPpMgoUrMzxiewbok8JO/bRn0KrD3TYnLyr859e/dajWGMqC6Mrx11
 PBzBZok1Hxqpb3xp8+8fWfBu9v8HmGcXAiYonY3D0353xx+MlElpB/n4XVSfZ+IjU6zPIXWgE9z
 kSzyvKMvKRoWgqvycNz/N20PCiZoM9x+BrXhq3KtLWcAN91nRkpkSfd6CLAfx/52G8X7jdItOTm
 enoJ2hs/H/WKIx6h18rRnQlE8WfDuIOYmVDsDAzZwWonJj5bLg3txBP0eNg6umr0GO6ho5I+K5Z
 hK816QUGpjzAmJONGlzIWZaIi+gnPQgdU2yuPJM21G90VpS/80Mc35G4ErlhjrCepk1QlzYB6qh
 wVfQiX+8up6voJ3wxdyuBPT9ceBJe+AFTrJcO92TX2/1CiZpcrDxBoyuwhQtFn2HYdfFAtR5TAy
 h4ZCX4ViFOlhE1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8639d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jpxe35GwxECRtIIZr6QA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX44874hX4S5hr
 nl43sA4quZKHXsClEuG4Id9fC6VdjbAoUND9cnd9/gi1zh3RffDJBZLY+6Z9VOo9H2QJBFENttq
 vrVeTkQo6ogqAUaXQ0hJhR73//hqdfHtmoKoSQy1lHhzA5z5y117WeWmckf6Ks9wcHev5OyouOg
 aZ/916vQQwijWlp37TF5RWeWuGx2y47MJ3nF6oLBiQ5UEK+mnUHPHB85L4ZB5/PS84XmZzcvL6Q
 JpvZ4aNYe+CYvSN6Lo6NEyr+mpLPIrNXIUl64lfsxjC0/oIl7AZiUaJ353uWl2R4NTz6XcQn2wD
 gplrKH0FJzSo1IB64IHJdRqi6V+ZmM0R9SBg605K+EIG0nuoZ6DEu7uCvwt4ORFYppYB6zMyVx7
 fI3kvGPXFqsVOwBTrm+k14AtcIIk88xb3L6GOVWxUvTmCAtqXbHrIrbMa+NO/fg3+yLGw50RQRI
 sAa8UIEkd30Ye1tZcEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfXzGmw2FG/lwWj
 6/J32FKGqFX6pUUGa3u6TkJKNXyZxt8ypB7ZoWc06ghaMUFRzChzlDdMJEn+ElBOZWOfzX/x6+s
 Jrx1f95nmyJD+mQjaoNJ7T1veNR4moA=
X-Proofpoint-ORIG-GUID: D6DejY_45APqCysRjqhizRjKvwKPfZfP
X-Proofpoint-GUID: D6DejY_45APqCysRjqhizRjKvwKPfZfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
construction and automatically calls qcom_scm_bw_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels in cleanup path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 67 ++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 40 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 28fb80a8496fe9a613228d4fe3acab9de2637634..73f8868c7bffa2a7149110c8b201d5e3c5c3c807 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -244,6 +244,9 @@ static void qcom_scm_bw_disable(void)
 	mutex_unlock(&__scm->scm_bw_lock);
 }
 
+DEFINE_CLASS(qcom_scm_bw_guard, int, if (!_T) qcom_scm_bw_disable(),
+	     qcom_scm_bw_enable(), void)
+
 enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_SPINLOCK(scm_query_lock);
 
@@ -594,14 +597,13 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
-	qcom_scm_bw_disable();
 
 	return ret;
 }
@@ -701,12 +703,11 @@ static int qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -770,15 +771,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	struct resource_table empty_rsc = {};
 	size_t size = SZ_16K;
 	void *tbl_ptr;
-	int ret;
 
 	CLASS(qcom_scm_clk_guard, clk_guard)();
 	if (clk_guard)
 		return ERR_PTR(clk_guard);
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return ERR_PTR(bw_guard);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -793,10 +793,8 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 								  input_rt_size,
 								  GFP_KERNEL);
-	if (!input_rt_tzm) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!input_rt_tzm)
+		return ERR_PTR(-ENOMEM);
 
 	memcpy(input_rt_tzm, input_rt, input_rt_size);
 
@@ -811,31 +809,22 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 							     input_rt_size,
 							     &size);
 	}
-	if (IS_ERR(output_rt_tzm)) {
-		ret = PTR_ERR(output_rt_tzm);
-		goto disable_scm_bw;
-	}
+	if (IS_ERR(output_rt_tzm))
+		return output_rt_tzm;
 
 	*output_rt_size = size;
 
 	/* A zero-sized table means that TrustZone has no resource table. */
-	if (!size) {
-		tbl_ptr = NULL;
-		goto disable_scm_bw;
-	}
+	if (!size)
+		return NULL;
 
 	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
-	if (!tbl_ptr) {
-		ret = -ENOMEM;
-		goto disable_scm_bw;
-	}
+	if (!tbl_ptr)
+		return ERR_PTR(-ENOMEM);
 
 	*output_rt_size = size;
 
-disable_scm_bw:
-	qcom_scm_bw_disable();
-
-	return ret ? ERR_PTR(ret) : tbl_ptr;
+	return tbl_ptr;
 }
 
 static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
@@ -854,12 +843,11 @@ static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }
@@ -927,12 +915,11 @@ static int qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	if (clk_guard)
 		return clk_guard;
 
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_bw_guard, bw_guard)();
+	if (bw_guard)
+		return bw_guard;
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	qcom_scm_bw_disable();
 
 	return ret ? : res.result[0];
 }

-- 
2.47.3

