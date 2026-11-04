Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788700;
	b=4ruCbMmY11oFn4rUacpdWq3qEhQtoOZZtF6e+jWe94l6gXck83G9PMtKQCR+ZRM96rK6
	 EA9Ho9TW8exB89DVF8l0gufCmYDcK1M4xqfabDd+9K5GpsAqlsXmBLoHV0ujGNm0pQXcV
	 QdDLhLvUDMjzkSXwfDTzkgWCZz5MNVnOnxCwzP/sQlgE4s/Yo5CBnu4orF2QHXveLl0Jh
	 bIhW/jef4WGdGFrnDbyLuM6YfaBF30RdqQMUPSDfGohQmEdq9tbGS5JVvZFwwRGE5QwZK
	 2v5lJj8agISLhd+J/0otaAR6ffpygC+dX3dpeBrtYs3LiAy2SJTXQ9eh9Nr4tNite3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
	b=iK8+VZHNulnS8QkVsWFmwRiSTk9zl6lMQnBMPyv4znXZ45FXbZzlkgFAW63sSyei9iip
	 zoTJOeVKUViMwtojBPp4Sr26IZS1qBnvMb00TlR1rlLdci456EsN7QmbaPut1ax+sihAl
	 Qi8FyNNcBXVgUbyfX6gvGCnzwewpCWRXmFoqJbneTq7DuA0nDlBfauJgq5kDYJ08Cdc0K
	 CgVl+VKCCll/w/kJDXVJDQTp5EgfwjkxRQIBAnJ9Rxb/LdialARauQOa+QYm1LtuO1p59
	 R96k/AnRGTvPZUhZSDahwiu3Cj/q4eCX4EkUth2EnQ8nQKhOuvdy283Msgy/elVcebg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKHdgQWW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hS3ESvgC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D1606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 10:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A7D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oKHdgQWW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hS3ESvgC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KfXA1263959
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 10:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=; b=oKHdgQWW0scIxXN4
	546ocSMttGSXRB2FIDHUxNLuWVlMXTLlvPaFq8ggB3EJWSE2z5Ft6myuaANDKEc3
	pYHAD8XnBTgl7xSMjsdGCxBoyVvUOOh3m3ANKNQcb2oEIRVNBS9cJV+rI7WuRqV0
	n1I/QuFzbzTjF97PFpuM1XCsuT7Iyy7vvROxqcQtBZawRGHqhAZLGRwgAJjXBTr/
	rwEx9ItymM0f3gJZhVSGAgUy3ygRlbE9ty0y3Y8EBsVCAm2/RBwG52ZBQGSMAgxb
	TWG4ykWkXMZBEs8RnFSLB4KRBjlxrKj8L7AJDxyxP6BawCSJBplsRiJiXFc9Fz7W
	hPHQxA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubm6ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 10:38:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf45382794so464548137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 02:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788698; x=1794393498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=hS3ESvgCSgVVrPQDbiGh5FWADCnSJUIrpT3zJCKk8x+LcVJPmVjpQZDzgU/V97RKd8
         NNuz4aRV7qH82BTiaxGk0hTT7IVRzEvpbd+kzm97MsYHwW5in0SiHyWH6KTsVC8Fy6vB
         +x1VswAGC8aNPEL2vbLwheVUIouSU0EX6c1o4Ib/IaaShIzxT3/kdlp51r8+2Zakj6sJ
         j8AVxJCk7EbdzV4Eui1VVZbQ6t0In+HkyzNtlvmAOrGmRXWEUwM+wUaN12RFYWrfQ2Fh
         tGcAu7RE/u/Rb9zz3DI9UJZRWRKgItJgAnauRT6yHQGFGWyy/f6SjBmmFEvaCybXEtfj
         ys6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788698; x=1794393498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=Whu6ITO687p4rU0QHdQm0xn2rku7fLbkJHGJhOGobIHFmu2a3U89HM2BucJvitXmuB
         Wyie0jIoLKUO+atsLWTTMYelydfmrqosARpG8OZ0lBwc6RZmgKs8urwXDDqMt1/UiHEg
         /n58ml7sm+Znj79NZtZssy9nOeXFH8FUPluPk1uDc4E6zyboFrz+1kvcOND9ECdxT1sl
         ObNGMuZiQjflb0EfEQN73zI1MNBTNsXzL2bSJNsWqSzzkw/RbgQuzH+hVNFciSDikQBs
         F+f3tpnlnygiwSQhGYuwcB8Mw0PG7U2RPJxLuOCL7Oj2JsvA/SxrnBf9yDI7rg5Ympxh
         ISWg==
X-Gm-Message-State: APuU4Z8W5Lm7h8IchsPvFsQYhbmUS5nU5hvWyBX9wivC0nqaGSyG0Z2i
	t68UlHziJGJIPPp7ometoJVdw13nXwJzT0QdsVDsgUMSGf3h663KD01jDOXaXLICE2aUgLm1Mp4
	57kApn4lVnSaQUUbtqNHUULbqzy964tVy45zucDDKQ56NpIvm6a8C1Ql9w0/EBFZSF3EY
X-Gm-Gg: AYBFou0Dse69+69e6I3h9kG1tPJYhG377M+PmJM/CHPoAce3TzyO328jZThnq06wUNQ
	zAiIadkAR0yyOwzYjDV0XQzKXI6HHZL18O2UY0QAXhQbKZA78A2himwpu4EM2zL5b6VbtpAV3+D
	dfwBnGf9p98K31hzkIWpuxJwzy436rfCCU+bU+jyhtiQBBl7IiGkwjAgLdtdSMQwCl4Egr2pjlR
	1kJL4++HMLQw4bb8kRev1rcYNp4fnOBCqy1OMloxKTus7YnhopMLsy/cUtasbMOanMZMgYf0/Mq
	EyqAlisyjaxZWupbadbrrJ8bUK5x/Oq47H+Zrea6xfMl3CVF+5ZEDrY90L+ZYESSfU1GGiFlMs/
	R3eLEhvrAbppkevdYI2BgX7Beu+nt5Sou/q+R31arVeP2AkXUbuF9KxcYfOZzPP5Z5BRlrZhiH+
	eY2w==
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr5836881137.10.1793788698453;
        Wed, 04 Nov 2026 02:38:18 -0800 (PST)
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr5836872137.10.1793788697954;
        Wed, 04 Nov 2026 02:38:17 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:10 +0100
Subject: [PATCH v11 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-3-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QekYjtrADoWd66GPIisjizU3FTTnaBTEJebZvmRuj4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsS8giQWzTcnzGnsOn8w7KH7wYj3VNToWKxR
 F660TwhPdOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 w2xlD/4zpU1g1ig8yOjuODeqjhjavqwmX38WB/82llu+qKwEmcTXHXJE6T2Cm7hrabPP2LfHs0R
 5G8CfKQGJkHHRWAbpuViP+2/RNjClg4TUbgV95JEyPiEUVk1dvCELDXwdkMp+5a2FOZeOFs/RBq
 CtKAatNbUwnH02Pu1YoTqfG1NwykgodR66aAVeiyqVX81yn1T7LPHwMZGEQVGFphnm2vG785E3m
 WfPxyD19MgqrkR4V2aVO25qVd9tzhr4eiLQVZmzIZZjOL6L2mrNC83+KWM/xmQuMOhlPYiPLoc3
 8opcK4Y7NFYwjJuf55/W1i7CG+VybfvsBmjJOSIIRsWImNTYxVzEq4NnHRQh0lieqKLPjdGsCCy
 9+XRhnXihhPwFb5czpylDhG+1c8T/B48FrTZzwasHsIkeup9wxgD7jF7wslj/8KYJYRLhB+iYHx
 NtuIYTjjGfldcGAo+n73GrGu6n2a+h0Hcugv5pmUIsV4ojcmwaksed+PoXjXpFjTm2n5eiIrAjQ
 NWmxip8+PIJZI4fQHb6CwwAY/fvgYeeWY7JFm1kC8IGCy+DfUbARmHuTQOq0crhCXZ9rtXcEEn8
 fiYUEYZgrJGoLB+aavgMetKbykROnkHmsqsn+1L7Z6DJjIbo/G2yq+wq6+2T/VJNaUTIxC9VIrQ
 sqqEsmanxnFxURA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX9U5i/4XvwwC7
 02E8FPbU7JQAoQ4Ivwo/w0dO7XaZC9OKA96emIPY/hNGPkDv9ZISw+6xO9XB1wxxPJ9lO7dbO2Z
 E8StubkBsffVOitUZIY3G/USFYIUndI=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeb0b1b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: qWXTOSiQyqXth_gFg5ryR6HAgub_3a5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX110QDorKTzuZ
 NSslad68KLt3h8LyNYyOM7of5DYJPT+JS7SCfFJO+gIuLCXlNiZWT/sivulmELnMglEl3ilHu4D
 aRuXwPJ/+cb3Eer38KF3fJj2DDXvhz6kXtz+KJEKk8BmY+xl7W+ZWH4SeDfvJdUGJScj0r29Xjw
 fWRmrU2jrpw6n9UNw4pWc4ke1sshBQZsqulLd8iYZFVFwaEaqVfaMVC+oAIJNtQxPnwWtRufcJl
 1Uhkl23OM8NeXHp/27Ek8UD2KR+Z2MkM/ySDjR/kE6qUplLSakYuBr+LqPrkXBA68RCLBAZ1pK1
 gmksLug6gfid0zZ0WP2f1gYZbaiRKd0ukPAHD3CuVGfWhvNGdeHofMJ1JE1hbW5lO/IEGZcYAt9
 IAxjwGJrq93DrUOkI7kCv/zILgAfccXkjXoXzbAloWIbjTDO1K2sJcI0vfzGtIJkk1xatenmdq6
 sklKIuXqicb0iox73gQ==
X-Proofpoint-ORIG-GUID: qWXTOSiQyqXth_gFg5ryR6HAgub_3a5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d..6b183864933870e54780715c4dd9179faf800d09 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -591,6 +591,9 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 		ret = gpio_shared_make_adev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
+			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+				gpio_shared_remove_adev(&ref->adev);
+
 			return ret;
 		}
 	}
@@ -598,6 +601,13 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 	return 0;
 }
 
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -624,15 +634,18 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
-		if (ret)
+		if (ret) {
+			list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+				if (gpio_shared_entry_needs_setup(gdev, entry))
+					gpio_shared_teardown_entry(gdev, entry);
+			}
+
 			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

