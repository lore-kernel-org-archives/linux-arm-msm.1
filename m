Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198687;
	b=ZZ7dUF6+zhNxixc/EvQw3/bEC0M8fvAwDCR/IJnYsi76/NnEk69Kc7W6gR4Uylt1feUh
	 iuzZMeY6/qbfyyHd54k4pevdK8ZSsNdyqg4wrLnYdGfDCWL2y0KV5hNTwdA7th4OWMRnA
	 5SrXKhk+v8INnFzi6p5OjW0aoH0ClYIvyE2jkGWcAPr8QW8hrz2n6wh2QVhvY1D4xrnzP
	 YiD0u3fDiA9PIjeuK2XT/MN+aU9qVBtb4rKdmXL3OJ4kKv63M0GZQGKPNvPxxg03KWCK+
	 N01yG7UY7jRU+hQFJkDtJh8xXD6Ex382L7Ny7gfpBERsrWy2teUhNCma+4eDiwh4jjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1VGCv7JfUH9OkdO/J1SJa3KIwCJqL5RZG3qCKIoL3KM=;
	b=VXckmxtvTl1Dw5IKcne3mz1lXFL0R2M+HOc863FpVxMQ6qUI0hpnMbD543000+S5/v1m
	 d6+afrvuLDoRf5Sa7UOATGR+eDL6ePxHY23cvhgYKRSjeSwadHyXeELou88ZNxs4rzbjX
	 F1RPywlF2pumyoVxZQng82FJ0yTQvcXOeGKUJD5lgJXjdUc95bsQRppTAz251dGfGk97/
	 aNRvXzBb4Nwgexq2rlANELaouxqqHa9duuCFUSWhhYo5r1Tb36OKbBFPQj/M1UO/M75gY
	 D3w1wpQzXCR5iHoBxKNOg3Yska+48aRX9U6cmHUuERvYB4r/tArVO7RhSaP6ohSKXCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+s5IBPh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kiZuFAM/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D39606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D39606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+s5IBPh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kiZuFAM/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI5EN718074
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1VGCv7JfUH9OkdO/J1SJa3
	KIwCJqL5RZG3qCKIoL3KM=; b=D+s5IBPhzqME6b4L2CuLW2PcnqqjN+RG6ls+4S
	l6ktsboJ6YtuQkbcyLe+ohyXEhnGwN52qxEyW/Tb3VEfsD3PeMpaa9EdJGRjGaD8
	9iq0QElnKBO/iU3syqrIlc5VLyJQBBapFZp02D1Tcf3n9DacAIgIcSFNKhyN4//Z
	HI+NWv8cffZQxFQdL71hHK3BGR6fVtqUtnkXdJltqN8BKi728YZlzaB45krkm+7D
	G1zPDH8UxPwRZ+p3RWf0VpZut3owzOyyjdNrGlggHZjCpKDmq7JIra+YnNYP0aXu
	VgWeKa+6rcqKMxFU0uyE1Cqyv8uJ8sgLlpTrdnuvAtt8IllQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgc81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso431891085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198685; x=1793803485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1VGCv7JfUH9OkdO/J1SJa3KIwCJqL5RZG3qCKIoL3KM=;
        b=kiZuFAM//BfvvSCulT+pflJ6t17qHc+aIrTtwKcAYtq4OXJJ1nZ6z2ZWLx4ZV8SDqo
         +wLbQyx35RiIBPkBwvJcbFMoiXcL+uNrwM9Ti0Jj+HKanOcTuiGK7j5xBTjm0aAVJSCS
         P02aoo0unpvOKM5EMBZ2OnrYrBmYmbcC6OkB/x3MwJJImu45mGqQoMW62cp95kfSTzSU
         i6iV6Wxr5NQSxojfwULIjrGyM8nlAHelE4WIY9rD8UjiJv+3yRrogWYznUU0JZLlb2qM
         T9GVUTNRiLLuNBl/nqIFYfpapbWhEshcq4L9+0ok2VgfWPuOfKhtb+1mGOtzrB2F1ogH
         Vd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198685; x=1793803485;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1VGCv7JfUH9OkdO/J1SJa3KIwCJqL5RZG3qCKIoL3KM=;
        b=SvC0TU9/hg4aeEe5GFLbSIr9BYJYiiHHbxQUJZ5m6cSgTZ+SRr9Vqsg6XMC9Z9BEyi
         F8WA7/6lCtIyBiP6WgACC7OVY763ODwJuOjmna8NmLSh6P3z/CeOIJUBarRzCrPDLFFc
         f37OAj/BW2ZaA3rRicOhUziERgWPKon1kuWWGMkyvLF4TJQtaF3rnzwRhWn62jWSgmGF
         vKc6xn3mJi9mW9rliokimZMOcHGjrP8favitl288jArcA/rvW2BtFnjRAI7qMJpRJY4Y
         yiuTGu1a99gQdbf+Qk3DAMhG7oqLeuQV+1q2RUXplfmGQYl6adtSxcL3+npJ4FzVmeWn
         55Sw==
X-Gm-Message-State: AFq9FYKoexz62Qooioea751ZkspyPgDA/89QHCLbUpHD5lkdBtDWsgNs
	xtLXHNY7sLprzb+NSHJWXZxugapyAqO47FJOqszdssjOVXN8vSb1iJTaYcE88ppPYfjccyre/3q
	klp0cWthhq5UMaKJzmconVOQRVFgu4JQB8M98yL8O2nBsdQayi6tY/kxu+Khg4TBxjBjx
X-Gm-Gg: AYBFou02bm7eVl+XGXcsWjN2IWbndxbyIJZUuTyDS3bn2HPetbhiWSxHUtjRfyXE/W0
	8GqvZjggikTRwJsY8Ta7W3tXRydtvEpk9MTM+5FeSAQ+wMvaClbcnPee8tRmDxdXpHnJEethk2/
	0yteN3v7846jpIV11EAY5LCs3TdQid4SCxyijLxuNB6ZVQ21JNNpsL2wBOppLs0UgPEgRpdFQJr
	plOS+Oe0TdU/C37KLE/xDpi8ogLYL5VAK33vcOGUQmuu1Ag4m313w/b7/gCwhoeCTPEdj9+BOzG
	0uh/38jOhwowhnxjVvjtOibHbUbN5CAjVPVB2ui/cygnqXTz2EmVf7kONw/k6RIJpQmDsYZQg6Y
	azoJi12VJs7wEeafK5GugBstLaIf1UwoRMtH+TxMjqaeoAgrgvsMVHkOjnPkXiK1161odtauVm3
	nNwA==
X-Received: by 2002:a05:620a:414f:b0:93e:fcac:a91f with SMTP id af79cd13be357-943f4c0c5fbmr869371585a.37.1793198685154;
        Wed, 28 Oct 2026 07:44:45 -0700 (PDT)
X-Received: by 2002:a05:620a:414f:b0:93e:fcac:a91f with SMTP id af79cd13be357-943f4c0c5fbmr869367885a.37.1793198684668;
        Wed, 28 Oct 2026 07:44:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 28 Oct 2026 15:44:36 +0100
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFQK4moC/43QzU7DMAwH8FeZciZTnK+2O/EeiEMWO2vE1pSEF
 dDUdyfbAfVAKy6W/pb8s+wbK5QjFXbY3VimKZaYhhqapx3zvRtOxCPWzKSQVnSy46cxJl56lwl
 5+BwSEj+n9HYdObXWBkdHc0RidX7MFOLXw355rbmP5SPl78eqCe7d/6gTcMFNg0a3AEjgnlMp+
 /erO/t0uexrYXd8kr8gCAFboKxg57SwLTSgvF8B1QIEtQWqCmpjlAfXYCvCCqiXoN4CdQWlNMq
 h1SagXQHNApRiCzQVDNpJDF6YDpsV0C7BzR/aCloX6rlEAaX5A5zn+QdJbE7JXgIAAA==
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ScR6v3zGc5sgWN3scfpj3rC1MZqUhcrSV1NpKyIndZM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpXtLqDD8WtmFD/K1mLY5HVnxuKxP+bO+dFz
 itqcoFb2TKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKVwAKCRAFnS7L/zaE
 w2tlD/9ahytrQljPiCNGMi1MUb7AAc1VmfVW5a9aJJA4fcZxtaWjvYn2g3aFPKkQZEcIwnoyiJC
 FrSKqIwpVaTPPcDTQNeyk0vh4mbvd5uBfc9RgOaqMVFDGdg1TqCAfguT4fqbe4EWG5nLhLbuXHn
 jKaJG9QwdPJRp+oveie7Rkido6hJTs6mN5TCXsmr2/HkM+ZcmwwY7Q1qjnLx7RWRqKiOMqNDFKe
 YW6Oea/7IE59voZH6lBHW+6V0Sy6nqADBmG9YEt1LGWoFZZDQT8/4HBueja504JftqoiX0ksOS4
 RlhUjJ3DCYnSn7gnk764ogWgLNtC+08emJiWAbsThgtU0Vdc95hbNyNujrjmRKcFi5QzVUSXyjD
 WRl1UKGj93b3TMrbnfPpR9t1dpesigTZp9FrSXUV9e4IuXOtjs5V72Frw1dA3tKU3yNs1LmLK22
 ccq0EAaW/YAsly59xhM9zfFoJP1HciQKJhYPeUiMpJBRqNmPnf+8vENWirKXgfMBld/30dosGSs
 bVFmR2+3c+NChizKoEWRIOFf3JzFvYPsiqxTkDs7p8M5z/tBfVBtKzhxXF72LblzNyIHFM4ooqo
 ki6WOItuvzi/q2bT/7kB7zVgG7UugYftQytwFxxq/Pe4B5c6rWwPkCYo/cBvVOQ6McTrLTrzzw/
 153XpBCnejt47kQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX6iPD2F6u64zW
 YOnZzv9qfsy7attKcIXuNmsI9axTzNBhnnd3TzCw0ZPRGGBWtM7zbdF4oc0HNREe1BlkHgvpAKN
 MtzaF3y2BCLvRW2la4D8GL9EaWlPUcIQ/CqF5uiGVuUAeILE+oJ3F62KkAk1B9H8NsfPkLfTnFB
 o+2sRuV9FU2AFrsTRfgfRSyNXLvMWH63tUyKnrAdGGW0slW3koYbx/z6Z/ZTQQQqoE+F0+hwVEu
 zrVYMYZPtmHgGVUsPH5XnC5dL3ySXx79FJtfvTYZVY8IEFUeKyk1TLcoqAWXgQ0An0BnG6v6Eua
 BF072nMO0TyMmwXqEgaz0R75nfE0fMB0Y7czQAJu+CJJH6WUX097+Kz0DOul9hUuu/oP0qHPjU9
 iS3bxUV/XnKbzLqaiqj8gYmWIh5fFdt+UdIPf7Z5FU6EwO8L4WvWFjHOuRSpAbfJozGLGQ2RF3D
 DZ56EGTTr6mnME+4/Tw==
X-Proofpoint-GUID: 3l7ctqTTO9aiDShMKmyZ6Z3bVhsrawA_
X-Proofpoint-ORIG-GUID: 3l7ctqTTO9aiDShMKmyZ6Z3bVhsrawA_
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae20a5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=bfS4HX7CHEhzqB3VPikA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXzdSg0HPZAonZ
 5ZcNXzvBK5gRTNV6SfPhXImRk0iMljxjd7Z50mk2+EPInJycvKm2+MyYNbHIZI1ZslgVAxW0XHY
 idXIQHJWvqhNvZ20QqLP/qU09D+tR9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Fix race conditions in teardown path (sashiko)
- Don't allow passing a NULL fwnode to gpio_device_find_by_fwnode()
- Link to v6: https://patch.msgid.link/20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com

Changes in v6:
- Add patches fixing the error path in shared proxy setup (sashiko)
- Link to v5: https://patch.msgid.link/20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com

Changes in v5:
- Drop fixes already applied upstream
- Check ref->proxy_dev for NULL before dereferencing it
- Assign ref->proxy_fwnode with the shared reference lock taken
- Don't return uninitialized ret from gpio_shared_make_proxy_dev()
- Simplify error handling in gpio_shared_make_proxy_dev()
- Link to v4: https://patch.msgid.link/20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com

Changes in v4:
- Fix arguments passed to ida_free() in error path
- Fix memory leak in error path
- Link to v3: https://patch.msgid.link/20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com

Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpio: shared: factor out per-entry teardown helper
      gpio: shared: factor out per-entry setup helper
      gpio: shared: unwind partial failures in gpiochip_setup_shared()
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 315 +++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib-shared.h |  15 +-
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 196 insertions(+), 154 deletions(-)
---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

