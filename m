Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F913BF69A
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330737; cv=none; b=KBlWlgu5boPs2LXUKa5Z2pFGj5FWA9KzqnHzmlfsp1j3FOixljhu8FJK8ylt8zUgEx3NXTvwbTBVZzKsp+RWpn1Thjp+86jLOkXrWW+LNi5y4Yp2YLSTgIx9m65UR2PK5vXJk0ZnzqDbn8ncrXkUKIIt4Z6Ay/JIDOp6iG4zRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330737; c=relaxed/simple;
	bh=0hivd+NbwcO3jYkg4nrQUymtlVO3eRTGvyxQRmrq9cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8rGTvtV4QRpaoaXnxNaMLi4kJOKfAuYlhtB1O0Ajf+M6qdNuCCr3m+FLQM4zTprL2ArDblVFaxvTek/UuaQCAKZ2sbRdiUh61ECmGMs1BbOlitHDff2ZEJGYPOCeQuvxc7bXwO382dhVlswjjzATS5c8ZG6atoEB46psTYWA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m91w9Nph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqjGAhvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m91w9Nph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqjGAhvh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0YI43041226
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LNaJ6hYn/3P
	1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=; b=m91w9Nphu6CWLLEqAiNoxLRVtrB
	sxVozXqqT0M7UeyyO2naBT7sqD537Fm44KYZ6emfOpMDkheushHlq0IbVRwjuhn5
	/8Xf8nerCamb9Z1yCHUpr8J9fAiuPWN1E5vO/wWh6VZVP/XZwDTWbYjEcgDrg+4C
	54HflQmoperShDR5sLnr0+Dqia3Z2/fhfZSzQSXDJh1Ou2igFOTlhZJsxI9n2sF9
	MuQ4hw7mn9WcpT75OG2q0/O5xJRCR2465rFFYGBhT7Ctm9fp5I+0BLSjNgx8uzI5
	acMKO1bwdP+3n6RaBzcQxqHnJs3P01nI4BDGLo61h8ENxwQrGL4kG9PzTzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dm3ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:18:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so684948385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330734; x=1789935534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNaJ6hYn/3P1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=;
        b=OqjGAhvh2DAH9r3286Zbd++b0BYaNgYbA4PwEkia+PKT/CtRiuR99oPUhfIMoWwZgr
         6B78oomeklxYuzgW6pNmtU98xvaCCrPSf5Iu5jlN1qa0jwNyWDbY8hNpqMBWzrZJDXFG
         PQhyq5qnK/PTtRi100KE6d+dQWCcswJhGGQ9+Q+mhjRDT6sijzVcTEbgXOHs53l89lUh
         fsC9eE20szARB/bSjqU4Rstut58pk20jyOYH6Ff8wqLA/s8u4kgb0FnmJsOJTfrW6iX9
         ZWwloOMEJ2MbPrwjr+7mvJDcEj7AgPaMxkA1b4UeoRQeDdGYe6OVvFC9VA8pQyR80E9w
         kHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330734; x=1789935534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNaJ6hYn/3P1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=;
        b=XAkYunxorCH+F5DVz7fzFk88OH0hx4x4cgMsl7JIr7YYsAaUYDSFNvXUDMO4ucCYB6
         loC3ICus3afCaRzs5XgdQ6VMyKaDUIPWYAW6s8gIRZvfAsiGtoBvOTP1SDl2ywtV9Fyr
         3FGkLJsvRzZ8YJsriLZxUIYCR4mKg9C1Pso93zj7m6sX3SE3Mh04wvjmvK67H1/yXg9L
         xCwkqDAuCOuSJUQr/p/G89GlB7XHYAxXEFPrtKOe8/mvYYKSbtYrakGmOurTg2OkvJTZ
         C1Lb3FkIelPAsU7VPF0SQKjQ83JeTA9RksfEBoQqJheanmUnA0qKklr+e9jRPy+/vroi
         xlOg==
X-Forwarded-Encrypted: i=1; AKwUvBxV/mqoe1eds22g+azSV/kKUv4SXBmve41+0H7l9KjCmOUkIMjDkNguUVnsZtIxlLQpUQXd3mFOWGCHhvyz@vger.kernel.org
X-Gm-Message-State: AFuF++nbXLGKECeC+MFmz0zQIv5+FYaZAqwKa/pf1KpNeiKK6mNiGtqa
	LMwW7jCff128BA5U3qpnoc4yyn/IHo2P7Y6dfhp3nnhH71CKQhQj5vvIhazz5r+wF/fsFzJQgou
	AKSbFHzFbVvciUSjUyMdKA8BPOk9HXDec+njYONZrkeh4XbaDRLHm9nbLEi1jPTO7JzKe
X-Gm-Gg: AYBFou2/Ssr/8SGW2HnQx/EpSewqNNU41OCvpLYgvXBThQK8P/wRaBqHHw+7B0rKGKD
	YzqS+DsE3sn2U7euYv8vNR5BSGfmNrc90tJT3yffCwoZpLyYFzJNITQYgKRFIp0QtlvVihNCAa9
	d4jox9iG2IrvAYYmWxoZSXdBgo55z1l+NUMCK9lsOAxh0cp0mNASZHkGrLWY1bQW0zpE38lffaw
	zn98YTGqxShJecz4Neh8ATx2PEoef0kC7vG0/wnkOxvC+KmJhYqvkaVWASyEOf6IWg3FbOBLre0
	r6xxFUrA3RupcHys11L0sfcAoxqdz4Ne6DxN6m+T7/LXm5ES0hL0rFZqlqZJzLd1twNKuewpkoA
	ngqyvGoCBxkevFA==
X-Received: by 2002:a05:620a:444c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a03939ffbmr1125869985a.46.1789330733793;
        Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a03939ffbmr1125862285a.46.1789330732863;
        Sun, 13 Sep 2026 13:18:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Sun, 13 Sep 2026 21:18:35 +0100
Message-ID: <20260913201835.250085-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXyyJ/nvZi5+wv
 Zm7VQHRBlFvNbkYW5bqjmXNnAf2jRvoM9w7wjiZqDx2+XJuTealfCgqTiVnWQt4+gsYsADP9pEQ
 HfYsQqyPRutQsms6UXwv0Yjy/Y5lxUaVrwaRtlI6xJ/ZbzdDH7ct/tpuk6rCXnAFrg6kjHacG5v
 wxmF52coSy4SlIx2TkSFMdOg1L447Ew/NkOmOLHAj0hyDpGCkT02nfOYAZVu1hAKw0Lw2MVnF90
 FrBttUQZvZc4X5rz9Yo0UBQd7zLyF7C1ddJuJ/smtAYMiNtOMdSRw3cE6wQRB8yzV1KoeVU7b+0
 yIi5vZwrO5UwP+wqPM5JJovDbk17rP0iaZ2oWsR3xxUf8FOL8hMYv3c73kY4mZ1cjPLsEL9gEU5
 gHYF5RjLZqtSfn/JWOFjpwmPr764KLbn9JjpP++YFoLEPWPd663zFA58l7FuS87sxt3PYlldVyO
 YUqe94YfCg4gwmYLlKQ==
X-Proofpoint-ORIG-GUID: sZdi4r7B9Vk229V9NpRn556wtWH8Se9r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXyWsU21vmXRZw
 FFqMqEc78Pwl4KKJpegud0mN0lKuzIFcG7Qel4Tp0nAYkNNcMsN0MbkodTqoW9dp2waNEARc+83
 tjWxra9mS0su7DZjXbEA1XPkmiOYkuY=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7052e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sZdi4r7B9Vk229V9NpRn556wtWH8Se9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..aecb22bb9662 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2233,6 +2233,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "medion,sprchrgd14s1" },
-- 
2.53.0

