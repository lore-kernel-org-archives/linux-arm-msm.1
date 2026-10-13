Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D14FD279
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897123; cv=none; b=o+dOtzH6lpNDbUkfJ/NY3X2pRRDiC+uYaVSdaUTFXHq+0XvkeVODLhiaBJHgxTFKS2+2LShxjqZrswyhPi5zOCO7rnaQNWBHmwD/Tgt9KvoZvqH6q6N24Xy/xrpg2STrRumqCSmeOclGGyVw15KYNsuqc0Gx3wsfVNtkISOOOFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897123; c=relaxed/simple;
	bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYGNt6F6oiNHNt1BIE7rMQPH2jZOzrlTW2SSAzSYBY+ftD5ZOnpETWj99kE5XIphElNQrgaf0Zpd6fYf/uDZdLyZNb2diNEKuU2NQYy039SWLix4SWcnq8IzVR0C3bWd4ONnqnWMAgeSwUWE2D9iE8VzpPpObBK4Npw51A/KSPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THY2xez0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzisTLi2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THY2xez0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzisTLi2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8jqus302932
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=; b=THY2xez0H8z50ENh
	xxhqmir2LpgqQjNVlX0Qgnz25JfX9MMrSUevhDBNhJEkPdI25aC3Ru8y+T6RfTgD
	qi7HyaI6Md4btNjm362nygmiaEUoIxUlXylYKEzO9wf4NfKk5zv6TrOCgM5EpQkF
	JPZwhe0O8jBQ/CiESROzcVhdZ00QjWkYqu1jjCz+4Mi7KxjPRz+hjZn3pJwIj/ff
	Y5sRqO0VK1fxqbtIhgSXkr7AFRy2ScpmzqCni5H+ak4yhM34BCdhXEAxtyCaSgPZ
	D6rQMc3gU9FgojBY6EJXWZsD+NbQY8aFOfnLYcuHcJH2L7uDFIV9f3v4PBYDvOK7
	uS0fWQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqb1n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:12:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98ffcd394e3so201970241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897120; x=1792501920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=QzisTLi2mq7swbhZjiBSFNJmt7lW6Y+c/ZFGIbxzgMmAvJVAnzzEizYgW9o/cmlIVJ
         OBob93SZU7T2uB1BrLi8CsQ7yu2zg/mX1FUqo1eB3wwSL9ScaboB8/VwOx3IImkmv6oX
         z20/1z0aFJh1PTos6aI9/6COq4VpR6jE+Wf7A8UVnIFX5KDsaxoShSrkZVjhuBTjBav/
         t8MTgzXTJyO8Pj/gHFrZenI9WO72u56vf9WaWEouZ2oTrEcZtEiQReNWIXgnYPt5ZIgV
         b/D5tHAPFi5QLBX46lrfGdK+cADj6jemtK8eo1m/4lVg0RKLUxOEw6Fs5aZcr3nnEpOa
         Us8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897120; x=1792501920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=tVwXI8gu5SFh7xqBk/Og0s1eDCMznmTbp2TdMT+uCIQi/4dogc1ZBuQMLlSnT06UZC
         YMB+Syo70CpOri+uz7xZBl03JVJgQW7PVCrlGr0FHKEn78SfZLmNfjef1mdWDWOBVFNd
         8VlH34JNU6jMWReOpfOCYv0MdgQewlZNeWe/2OiaNVQdQfcYCmdtxVfqz+MU3N/n3SlQ
         8OHKR5wVcDMxyknY4/y/JFDVYztQRBWknzq0BAH9+C0i6A0WlPvtQv/2XWLKQ1hxXN2o
         9xSmIYtmzs6B6fiLQ557i7ksTMA4RM3L4yoZ4PhPQDaAiT4KTCHktOff2BLbHtc7o7cz
         svyg==
X-Gm-Message-State: AFq9FYLPoXl3UgwaCLvPC9lp1cV7ffQcEVil2m/dLgjsFHzkF0y46eHh
	TdK7eBTWS/+ZcKebzYMLDj7jFPkG2xPQ0KExchOxWzQgEANxx/Jb1PgZY1z+bYMeAtrQDLhW0uG
	u+MumCzko0ub1D/ga/yv730tUK5Qz4/0E4WIojlCGm1YZ7TdQEmvnMd2f89MbH6vloxli
X-Gm-Gg: AYBFou0X4GokPwLaj/tWgoy7HbnG2nk3VOchnycmEqBA8SEX6KejbNpNFpu4LS66jBo
	lgCO10L8btlszYcEfhEYfrI/lPDIwfhiJWspt6XvGp2xseaU6hOq7SpZPaYJ0zyVujBwa4fES6H
	v+LfHCao2qoADO1Jx13DqsT0liwxwUte39dtNCNj8GLXuhme+OOEMdDGyWUKFtTCE2dRuwdJz6h
	dy+1mWBxAgYINnVK0LFWA/K2MxEF5jJEOM2NlIYj8+UMvU3t+s7alaZ1fUyzIoBhamB0XRHIFa4
	KiH+pW51y/UX+fjcgJw46UeGI+e4FBEkCAI+1loy6CDEmj452IiHbSpRVizzevSjefzUzvNMxQc
	hHSeKwOH5BVGNwEkRUjCBomTZQBYp
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3132628137.32.1791897119966;
        Tue, 13 Oct 2026 06:11:59 -0700 (PDT)
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3132617137.32.1791897119501;
        Tue, 13 Oct 2026 06:11:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:11:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:11:45 +0200
Subject: [PATCH v3 2/4] gpio: shared: gracefully handle no-device lookup of
 shared GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-2-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4TEUKbbuDgFXBUntbfXe6WAmC2bcsmgvEp0
 FPBffm/kOCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uEwAKCRAFnS7L/zaE
 wyqaD/0WvJD5QVZ/b6AaO4FBlY9lKmz/XCzQGAg2hdZKyrISsfrHj5B5FWh8L0fINSuUWISwF5o
 b7mZ2ndNIVQonatCZr7z+uknukVzJmeIgbFwS1vNorye1K7f8I3N6Qyun1499Of/e9ewv3ImLJa
 zImRFmqG1FSv599ziv+YDKS/z58R+e9AZVdmI4WBJKCiZ8G4Jnpme6gQ0eJcIjM+asmAbfukKaa
 LPXuCzvNvK6juM3l3yG7EZ4GkmaUSx0lGEV0DzYZTZEfvRPWHEXYGZTlwUXnSwgz4WG2VmxyuPG
 mAvSzdknxSvZv2ufQaYUJD3ppNCLWJQriEmRVkD67FvZz1/IcQUV9uVr1M+ZdmCUYh3aHDVPyy9
 WVML9mqZ1pmkX0uQgcMGQi/ZThwbzLqMk7I9vz2RTCG/G2plm1LQrQsaeFLcleiWdeJBS/7fcn4
 35/j8UCzo254G4p6ueD5zT0T066TJP7miHB+wEZJG2aKwjY9GrtlZndpUesR5ZzM6cj+1PLVFjX
 VAZZD9QxNovl9h7LSFTSJLjzgMo7wpKkaSj/jyfs1XdOsCbwVnE98DvfaWC+B+oJPNLrlyG2RBq
 pXZRlA+JluOpx+LLhwvDxuuGO3Y+l8GzRBtb+wde7guJ+t/RkG0UuJxBL+HNG+W8/LSHEtIFu48
 OcoTnXKL6IHF44w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX/Vbiq6w4770H
 peI4FLVK3a6dSN0/dtPZnjsIA7NsU85N1jhPI36n2vUIxmbI8giEUBejsNhnwmOBJ/Kb17jcvxI
 CgL81oOuhxxIJge6rjhY/hVpDLaJG3nneTLS00OwWbnQjDn6yWnXbJsw4Om4UTxebmYLAGWSYJM
 QC1p/+H7XOOw7n/ht34BOb8JaS8UKma3v4mTjUmh7IfFcivKv9I/0CBol7Gcnh1nSC1tZvVIM+T
 KxUfX9+Od6ANYmvOgs75RL2sxhPIFPpc8iDwCAkERkyBl2eAaYIdidSHgj4xtmshHiu6c+jdtmk
 P/EaZfjnHxILVwT9AP0+UV5HafbyLrv3Y+x/m16WtjqOyo1J2arvDGK9IFvW+7WHxT5vKG/fcp3
 4ll2w0ZmqQbbcJeorC1vtm4wuvZWEL/pc0H02pEgkMY1+/XO5gwyK6SGkAvTNFCoxU1uEAyYx0W
 WOorSrscH4GFZ5K8JfQ==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace2e20 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Il3CDtT01e2KgOc3ggcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX3rLuztz2AEQZ
 JE0R1qT3BqoVJsuh/MsaZ3RGaAD8aWwgRqBnUryUpLKLYspgZxmwPODv7ZrKKCxTsfKS58wTB+Z
 uTEi0TZ9A5Gj2dyzNSyn3gnYt4cfGPM=
X-Proofpoint-ORIG-GUID: fIQNQf3dSlPoUkssWzhGttOZQHmbao5W
X-Proofpoint-GUID: fIQNQf3dSlPoUkssWzhGttOZQHmbao5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052

We use platform lookup tables for shared GPIOs. This mechanism needs a
struct device to work so fwnode-based lookup with no device associated
currently causes a NULL-pointer deference.

Adding this functionality will require a larger rework and it has never
worked anyway so add a check that allows the kernel to gracefully handle
this situation with an error ahead of implementing that functionality as
a new feature.

Cc: stable@vger.kernel.org
Reported-by: Abel Vesa <abelvesa@kernel.org>
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..8c9ac9d9330490b17fb3936b8758beb97a308a15 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,9 +449,14 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
+	const char *dev_id;
+
+	if (!consumer)
+		return -EOPNOTSUPP;
+
+	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {

-- 
2.47.3

