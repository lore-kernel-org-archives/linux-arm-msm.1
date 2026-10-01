Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA0451FCA3
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865135; cv=none; b=EPGvmJ8aQRAhkGB4qhx5gNUxzxxcm+YwvasOLQZnpGQGumQB1FqLZOx1tHIs7RwKUsJ55Y6scZ8ZRsz+Mp2yrWo5RTuMuwKtIVy04Bg9FeuStwnPffcTd+cxQrpPGD5BaS6Kxb4e02bhj9G5ZCdRzzIGj3XUhteWLOmouVephmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865135; c=relaxed/simple;
	bh=yy7Pib9Ot3rjpbb81T81P2yualDkr9btrCVtiyjdhb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfPL4IgXbCOhtYJYRS5sjnHMiBAjNPE+9UXc+wQnLV91yYbSBiMHX509qQ0yo1jcUrItIYn6gv9zdJMhDSXUbGosvoCsjBZSBb2cxhIL64DcdwFTKJclCrpXF/L9bqKMERH20jvN2Of4Kyx4wexTKhiMKnmbrD7azOGKkCYlUU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvrDABO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCI8XEDI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvrDABO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCI8XEDI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Djfil2570742
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=; b=FvrDABO+fys37/rW
	wMDcNM3X7CnW7ZhXHmgXUy/50YJxc0w6x8ekY+OlY7xEhPCpblfbh4N80GjcrxUG
	WWY3r7ox674e+6BPMfXI8HKe0rm22B+BpxANjl24jwXnROQLRKCYaGWTq4Y/scPH
	MoAJuzC9Nuaczkw23RkoQ6m9n9av3u1IVnzREeiO30/kB7uCU3/9DD1ZQJBlmuFs
	zFnEO5xQkGiyEKaMSshVtZPsZNR4/uiBW9IEqisjFfOJ3p6EAvDs0Y2um8s20HFm
	l5i7GLxc/hPzlC2XvP10KfWjCNG18xx5dJYHli1Hn3ImRE3Qypk1UXUsJRt64UHX
	eCrr8g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pnkw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 14:32:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7be858243a6so353075137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865124; x=1791469924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=;
        b=BCI8XEDIIguWO/Hodns1qqt6jMlpAc3iTA9mWUYY85kegWM1UuPTNveU78ZWDTN4aa
         V0sZxHNHiz2C0kCthIAJgTPgTWDZqNejdWujAajxwPJAd5v3wIfWphmA72jj7xAG3qNc
         kKG0OG/bdp8moVvNYzPfr3fYdR1GJ9Zc1yXlj8607Z+n7b0gADipbtueodY9bYe5PVLe
         o+W5QRiLsViznqsSviSzbXUAja44Sa9ldCk94E/fPTTdCf6WhDYsvKFRP682zO6HBG/p
         W3ghfC2LBSH/8jbGmoafjo8bER8pQLGkDWMj7vl5ZUSksx5JpwB2K9IIBeUFsud9HE3J
         C+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865124; x=1791469924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=;
        b=ig3By7KFbwO/UdCrOz2iFyA+yNnImsiygtw+jXciH2OoPgxzzT5unS/Quwshy8fW2z
         eJb4JLSZjsDFUOw7j0XYeKxHfjh3SnK23Wzc1Uz+U2XbxTzga3j1An20gbiUfrDB5ZEv
         Jp62d0zcoams2a5TaEsKupF7gw8eCUNgMS9DKO4LhoV/T8J1KIwYeR9OdExMZGEe8Q6d
         AozVQbQQ6fj9rr0uauxA1YCg93WaeAVqpto81PWu0WPAkfYa5p5ULHmAdum4pSDwloQ0
         mi/tMtPSmkTXr2YbMx5d9v2kIVchF81ousIWms9ZL71FvWbctRWFuHTVVLjfFjdgsdtj
         nFBg==
X-Gm-Message-State: AFq9FYIsNRx4h0LGvkvh5dF1TnVRm7x2nt4pBEoJcLGwiL6bX826tmn4
	14OhK943/3ceb1cABPPxwkBKgX3Q6QtI5H09yly/cNJIvCfXQ5646kPxExAatvRm3k7qVHm/xzq
	2Ejens+L0c3ZbEyyVC9po6d4GC9AhrF6JBfyw6v2eBlueGjq8Slz1JMgWl5Grt8fsQ2en
X-Gm-Gg: AYBFou1E67GyyGhr7O2WdTGCBhjNCWUzGWmRi7HuQ+ZvjuPQgXPWr21Yrvwg/7qyt5w
	nkSm2fvWv3tQUOpDPPNkkOpchq/v1b3eW+M9zUx7PGj9e0LWcb/D0qQ3bsR0i+1LJR7MHd/TctM
	p4oFdZZjS9/iJhDLdWHQYsFUNbzYi5klFkijzZ+7wcQaLjedh3xQSrZTu6jKpYy8zNIo+B67ELh
	1DPKJsolkNKaolCWI75/kmy8nIHrpHrOk2v48WwJMjfSTsERb9kqbJBP7VsxSBaeGEanq5OIZ+A
	HJyYMmrOSIeu4353a7D4JMDAgLsNu5nB4XKgwPz6aCW5ckYoFDU9ZkHcBT9VyC/DOE29t+c6c5G
	kw4bRTKmbRZKS9/MR7wv7xbbfaY5C
X-Received: by 2002:a05:6102:3ec1:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7be73a8e63cmr951298137.24.1790865123581;
        Thu, 01 Oct 2026 07:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec1:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7be73a8e63cmr951290137.24.1790865123082;
        Thu, 01 Oct 2026 07:32:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:47 +0200
Subject: [PATCH v2 1/4] gpio: shared: fix use-after-free bug when adding
 shared proxies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-1-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yy7Pib9Ot3rjpbb81T81P2yualDkr9btrCVtiyjdhb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7arGgWSkNh1UWH2RhGB0pxA2ciXPAaLPn7S
 1h4W7M6w2KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u2gAKCRAFnS7L/zaE
 wwUeEACh7rXiVwNmuaHRDGMZStz/A4A+P4qGany61NEtlDlKZp3d071ddvh1kju59DsTEuzvyth
 RCetqLqnsl7mHIMGeW8s8pSzHLZz4ILiHCy0dy5TZyhE5fPumgTkJA4o8EJEsM7Chrczt1g8RGk
 6+at3wAUsJVxUPOMNUK5mZCuBdL1HIPT2l/30s1GUS3XKXXIzG8coNYxvCZ3R4xP5nq8hIl337G
 47onkV8Tb4T/fdjPQPGeywiQOOpvzwWTmgr03ZsZSsq5ukAqM4uQU/hD8neqeqC+Sb9t/ns8U9N
 /Wb2Hf/a3VTs6aEk0ET2v/sdsSUtR3YonnYcqbZHYGzIJyPK6gww7pGsHIvwf/YfQYM5Alrf5qF
 2yWWU7VOQsecmZOq7p2xE9o+TW6vDq0HDBYKRXTAmaR/hRf1o1mwLocd3fC4GJY2yDzezcNZ3SX
 Muqom5amz2a4qGRa3aCShcsuKdR4FcLqPiWOGAkeJWq/JT/kKYaiY288bVtdd7M55LWXDartWI3
 Kg9n9DE898yGDGYDLzV+t2Ml6QxM6aiFMm4r+jYIBRIPO+ozl7uAqCJ+LD+KMkgCYidkCTfSZ8i
 mv7gyzOxA9qnz2kixgYpgSoEze/d9wgGpKZhS/pCOr2C8Kr71nABJiHpTusqXCGLOU1Xyk4SQp9
 kY9rRRYIcFcb3JA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JVf59ni6JyUOgr6nAx-EqUj7qUWmohy0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX4vDBwbbBRQfx
 c4vUJ87ETrt+pI8Sfl8JfFo2b+8hFwPGizFZfNr37F8wmUH4BrWjOKdVhUuNhM+dGnmuhGjuVaC
 2eWdhdeuIximqhlBy0ejPd8f435Dus0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXzv+na0kJnHE/
 TdJ/5yVvw6ucCxTDzmuCJX/Fr6jhE0LHgpSm+xdwzC+XsQO6bk9XoKbDq0F1AcLU8zwNrtV1z8v
 ZHR7mowoFKOTFaLcbUH39NVCfmvXprCFdmt6BHI8dr0THTXiSxRIRVC4XAaQza2YN+0c0O9rdNm
 /ocDl+WdEbQ35oIzMriRSZ5hkucvVacxF9WoZOtdC+B2SPDdZWvR3oF3amndpp8mNlMRLyoSjve
 o0x/uw/HGR0/BXdM32v1xjxIcLRagD99jsFiCCqe+AOsiLRwHdXYarBmLGw/PWJ0L6Hb5e7IdPz
 UrsbxiZ3qsufUhdYayoN7fVZlPHhK+69zsAxwcRevUJnkHUqekWZlO4MHl2sOWt9CtcziLnrmDT
 Ngnp5EHHdk+TYrSZwdvRlPct/Jit2joFWJnelU3XYcFa65SP40BuhOv0Ghm1o/VDlzgGzlIwqR4
 bPYsh/4ph8WdmHx/dug==
X-Proofpoint-GUID: JVf59ni6JyUOgr6nAx-EqUj7qUWmohy0
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe6ee7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KwuEG1lCUIphvGhCtYAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

The GPIO lookup table can stay alive for longer than the kobject whose
name string's address we're assigning to lookup->dev_id. Fix a potential
UAF by duplicating the string.

Assisted-by: LLM
Cc: stable@vger.kernel.org
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5f9623e40b0fbebcf318fcfb2e75768cf6e3f313..6acfec73b73477245c7e4c593f2925efbc8980c6 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -450,7 +450,6 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				 const char *con_id, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
-	struct gpiod_lookup_table *lookup;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -480,18 +479,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			if (!key)
 				return -ENOMEM;
 
-			lookup = kzalloc_flex(*lookup, table, 2);
+			struct gpiod_lookup_table *lookup __free(kfree) =
+				kzalloc_flex(*lookup, table, 2);
 			if (!lookup)
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
 				 dev_id, key, ref->con_id ?: "none");
 
-			lookup->dev_id = dev_id;
+			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
+			if (!lookup->dev_id)
+				return -ENOMEM;
+
 			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
 						       ref->con_id, lflags);
 
-			ref->lookup = lookup;
+			ref->lookup = no_free_ptr(lookup);
 			gpiod_add_lookup_table(ref->lookup);
 
 			return 0;
@@ -611,6 +614,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			if (ref->lookup) {
 				gpiod_remove_lookup_table(ref->lookup);
 				kfree(ref->lookup->table[0].key);
+				kfree(ref->lookup->dev_id);
 				kfree(ref->lookup);
 				ref->lookup = NULL;
 			}

-- 
2.47.3

