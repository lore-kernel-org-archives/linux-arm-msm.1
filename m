Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49651EE1D
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865135; cv=none; b=EU6pC+QSMcYOhWy+lX41N0E3H1ciRi3SQzxiu5feL0n3OKusYa/IoCXkS+Q8peaJ6h4zOzXX6gme9kS6AnKlkl8/r9N+WKoX/jsxAHac57CM3dw+kUNh6i9VfnPMAyVPvFmVoUzcI0zSU52QdCAFVlX4L1Rvze+gQe1+5WtLEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865135; c=relaxed/simple;
	bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7kSADCBncU5CIi9qlZL/ojh7GF8ftUtU+oA8eOOP+XEMBLYkk00VixJ18QNMsX97TojiE0moEl9uasilDW/QHXruFey8jLvqRm5mCLA8F+4ZSgG2e8aN4DqcDEayYWjSTC8idCcPh/5DqS7FedIoZWd93yBDFoZzOPJEwRdPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGqrN62r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRhslXMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGqrN62r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRhslXMi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjnZv1303971
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 14:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=; b=OGqrN62r8dbb3fEp
	2hZ6FTSNhZU39JMJS13y6y8T6sQWGOWcjPfLhjI1WtFwoHhY6+dATFEmgdJ6LNgR
	yzgk9XJzhyL5dyMs5k3s1anYHC8FICec4AlKaURDkYancMNIOQAd7K3FMSDbZ44r
	fHkmxthDG4st11w7hzKLRlrX+VdCrkN4yiX38KebSsPHldWVM4uG+AhG0+QFPTyK
	2ZhfYZHZblXe8JG8NkpOeBFR/aze89lfRUCBSSHOPY57doCtdLJm4esqE2cb46/F
	0i3/aNbTuEjNT9vxbNLJlUipXiMWwKupLcqrRo+UdnF0ZOIJ9c2PXqNbuZbDHQ3x
	q2sQuw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5c06j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 14:32:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98a829c43f3so184555241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865125; x=1791469925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=JRhslXMia+Mlttm2hKfB8G65K36PgX2sr7q4LeLf4QBuexocghOnuJPyHohj2VFtaP
         wKIPzA4Eyhlyl2QtEbJ8VcbdTeRkcHSqmWItIwkrUIbG51Sz34rBMpPFHItnfTDGIgR8
         qqD221WvBFzDe8joc+sww9oKfAAir+YUnocBgYyni1JIxsl8NTUUuyGgp5qTxsKYNxhk
         nUmbQqyJDdn17mu0gJdBHeFssxnY2LUumdGU/GOw3sEAVfnAo5uilIGMh032WdW/id2o
         BuFIbRU2p5UgntQleeEniV+8Ybdv3/D9KRmpW+gxk4+3JYQ9xOJhWrGQFyXTfF5STMm+
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865125; x=1791469925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=2VzQpFreh8bxOo7OXuYR/4cE1/leTVUPdqullh1DEKpmhpdN9YydI0cXC/ZTpksQra
         51watxrtK4h5DyJgxzCQnpxGVCjiojW9cY+q0EQ5Tvu8vS18vBlsmWgoI0cTMI+Ch59K
         ds8PiMWlvar9/cgzgw5H1p4Fc6k5bZiHu5Bru7uoQOfACJo1rQy+AG8aYq3urhFJhsV7
         846ofhHNkwXkHJTO6QVIKqsMHkjqhis1x4Ree/uczq/5lKfkSGUTYT0HWjpX2qDH/3UE
         RtsiDdq/BzN6bMewCf3sob5VE2mzubD6LK0NdF90r/Bo7LXKwkskZ7gJOz8202XJPUso
         L9xg==
X-Gm-Message-State: AFq9FYJIUECDeiD6C9F4l1DJUQXrOFx67JJq7U0v7ZSW3BxYEUIxeZ2k
	jhg2QO1rVEc1xHjVKLG/IjpoGvojrzTrHAhGZMSV6IJPn7PRQj1ptfRP8MhobAqdDuP4o3i9pSa
	WlRVBMbIDHw75ibPx8Jt8oRSI+mcvKDL3Z2myrmpYi8BO2lWue4EuGjxSNvyd7n6h/SnL
X-Gm-Gg: AYBFou0U/Spb1I9+ZNxb7RxBkLbVi/nn37f4ovwt83WqEdaZ1uJsnIemHdXT5Ftd+Ws
	5a5LXXeza0Or1BZyw/5akWdsa7BzfT+iirRHL0+xPjhi2p1CQvcKyANJrxj3xfzJtMQENDyIM8l
	5Wb6v+2Jlqnldu26huVqYtjzjKxPM2aCHF7JcigiW7+BaNoe/ZDwDV6LyyANGss28+UqRww5AQa
	VLPCrbfrXwrzvdbZxdUrzSR6I8BnpAdpjkh+cDcWlWRvUZDzLaaWEHj1Etvg+jqAtQZK/vJJHxF
	wTOmtFdgTgwnTLJPM1jIwLrSEDMEu30q4m4IX6PoUq5QW+FwwlHxAfZ0mSRU6JMeJdIQEnP39ae
	x84rMw3Hmf9T5eLPjn3fQrVjhKBfu
X-Received: by 2002:a05:6102:6a91:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7be729b71c7mr1290573137.15.1790865125323;
        Thu, 01 Oct 2026 07:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:6a91:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7be729b71c7mr1290564137.15.1790865124851;
        Thu, 01 Oct 2026 07:32:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:48 +0200
Subject: [PATCH v2 2/4] gpio: shared: gracefully handle no-device lookup of
 shared GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-2-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7bckSZ1ybY+o//FlZDq/jTtSz+dIe0sFgLf
 ckeiMEZXbiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u2wAKCRAFnS7L/zaE
 w6jrEACMGUiniK0U8wh/NiIcHtB5aUyJYoxD1cYjoMCf4ahoj+bUA6SljzCnmgdhAT1wSWsvNNk
 3p7KxOxGj+xYFJUGoPgK7kdAgxzxw90Ie/tHYJWk5lAq3/PAXYKuE+QmnfuhhfQ42Svuus8BSII
 I4jEd5DJjRFsl7nMKQaCGecRKoYEMPaMkiQticpPD9vaC1WuGfC3VglrdPMzy74HBVxinJuo1oX
 2VNf5Rzjor77EkC/7aiwSPDmGYo2hpLK2SNV7Xb4n+5+Q+zerAc+tzYIxe2mrTyIlx8lh96Al2K
 Ib+TY9h0HlSzGi6kljlq5NUXwlX72Y2RTf0sMA8OBhXoFdE2SecJoN2wYEkjwaCzcub9kcbK7Al
 xLKekx14hU2VLBk4PD05BvDtAazNPnz9hWHIT/WqSVV1DMbJLSfE3GQ0ZAL47pebTCLuSrpfD1n
 Mavz0rwmitllhjeUiTlvUjjTUrfxYHjhU9bShFux3PaZ9emTJnsGmo3a4t2kTwMzcKGbfOMzvOA
 Hk0E9mrTSI4j1iyCPEE7+UUcarGqaWKTnvjEomlDrLPSylF6AlE0iDtHg7HMxu08FvDNMUB6v7/
 jN0SXpftUjRID6wqFYShz/Bv9mM3BYLaOluZHOyDKxQo3jSTOl2aF5ZB6n9j/Po2brsYk7Ig8Se
 HSY3QKg88aZz8YA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX4dXNIHWd2j5u
 m9PUme1NqNTqd5xCyCTu54l4qjDuEWE/KE0h4g4gBUg+pmf+7wHQhZIMJZDO5Bzx2XIWQ3LFOv/
 I6f6a4Q8TvnCDWr6FHKfMX3/CngE/vi1Mvnv77EdaZjQ4h3DO3kJssTx/y+lijPx0NS11Aki/XI
 Np7L2IsVR3WruOcaU6XWk8xfJZkUUiDH9CMeJ2mtxBAM0Ou658gXJzXfVqDvm28A4gbQYPMHQh6
 YApihIdIH+N5rKvI1amStKt/SVnG6QgXrKwWqgwnF6R1AaAPDN5zQuxmJjYEP7WLhhOZGTe6Ye+
 TT40yte+E6VOzKVw36jQZInu/5B0zV+B51PRnAfhlhQ+1m5MKxEEvutRZK2+ji9OIJa0b0+VMUy
 LqdOP0XTYjGD2RVw5OM3OsujYhTHsL2MPu21A+GdpViS3tuCtOyP+Gj5XaaN+jUaJTGEVgFRlAV
 dopmmKnPfAhmN6DXHeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX5nw/+4DGuFuD
 cND7EKCxuS+WO3ruBmGZadX8SuyBdTFx2f7wPNtk864w9lCdpYwr+sN/1jI0zb59dFI6ioQZgnJ
 QqMlk/QFIf3YrSJIqf0mY7eub2NHzRY=
X-Proofpoint-ORIG-GUID: EHWPWva6pK6XybtwACgQH3kt8xJD8Qfl
X-Proofpoint-GUID: EHWPWva6pK6XybtwACgQH3kt8xJD8Qfl
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe6ee7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Il3CDtT01e2KgOc3ggcA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

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

