Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592652;
	b=3QQ5bLDbD8nNwsCbAOhLflsGuAMNzWoFTOEHoEYbU+yzbsZp8srV7NGUX6kZFKKSWoL0
	 jnBinOnXWlWZT2h2jQUKoWXIaFllb2xdA/tJA16pMVeQgmzvNLpzsOlTKsBb39pmtbPf/
	 2/SxQQUY0bt+Cf9ehYzASSbPW85DEuj5CbeQTfXb4ewlX3LoBw5YoMbJMAfVJXedfXJ9n
	 +3dd+qIH2dEj29pSPo5zQpQm+2LL45Sgw5U2+EJES1JUQ+avBZBZlGLUoP+o6kYDB2bE6
	 +481e+wn5sQVanEf6qslvwp2j2Vb1xP4ouqurjqq1e0NnzSfe7ufBM6sZ11dsdR4QeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
	b=USn/qLx1oQBCujN6GkI4ELNjrClCzYOP8wIIl+DG5vx2EoilCYRq3Nu1favI6pxMPViZ
	 h4p8hi4FHRq1eKt7bj2dsdxFMJQUrNhFA3xmy/b3FvwFPdJ4jk+y/df+cGMEbxhht+DXf
	 /D+NvUpCIYQoSL0z/KvhhKIrwXFDKsMASCCSRgIKG7dDTIBi/2jQckaEJJ7yXaXd+fmIY
	 Gwqn+ZFS3Te0rdZ8hZ0Fj86GxZH1jRCyzLDu1X6qN+Fo5YwFf+70cBHWm4WJ04lz1Vihc
	 hxSLpJ11IpdJbJV9rqGwu/NhCnd6XBjpNthAfjmx6yEnVkSx3adX5zmQrU2gy8kQN7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCvjqzBY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SL53nW4D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808FC606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808FC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCvjqzBY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SL53nW4D
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF6IX823493
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sbf2G3yrxB/WPvimhAHZox
	oMp/kII+FrDEZzGcm5u+8=; b=HCvjqzBY35z/m/+gpGWlok+0616SZOhmSAwntX
	8p0j+35OBgvq0ZzmYwywD0CST/t/EHNNjCVW+zqgKogjR9kEmePVuomMpKplZYp0
	bWzWZmhN3qx8upZFTisjmnoHSxQxFta8VtiJBAP5asrmqk3wD/jBg0lDEkXEXnbE
	jBB3O72QBJ9vVmY6KmtJGbolEa2PFf6ruSsAO3r61bZd7UNxs9Bjx+hFn2/W+zpN
	/FwuPbYULFkYZL+2ANgfU4QG7VJXpjDsvQz9libolilGynR4go2PssJUexEkQpeP
	MC2dgn8U0vRVv4Rvbov629iyWV1KDRnUJ7/kzIBqpTSjj+9A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3e45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so168665137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592650; x=1793197450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
        b=SL53nW4D9sgiVmY3FpfNglwNpC5Q0Q9dGI6szGIQ/1UaD1oknr08K/nj93AuP5hyyH
         0AkvDMnEn1fnUtQwOTvB7SMj6niMTLaXfQQjWdJ05lAO/z8Ct6yW+PltRXC2FScP2GmJ
         hkLMUrnEWb6uKdWC+ouAJ1lgA+jwSG6ubFXv5iMF50fgGEAP+RpuaL0rWKHiLPwl7q3l
         h5s4MFTiX3k7ggHSiKbZ2vfnTYIN34i2V+Wz/rHzMVVEP8MGKoT/ko4Lfc+tRvLoctOD
         kJ7aInYf3kwsbfsI+Bxxvi1koVK5rzX+P7pFHR1fsVstG7+6JV2JLuZtDX8ISAPtgrrC
         hSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592650; x=1793197450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
        b=C8gGzxZ8pTOOAC0ZKTsY6bd0u3ZhlK5pLuSKI4m9GKUtv5R8N4EQIofB5zVSY96G9Q
         a0EhA0DIk4C8OripKMHBlayuWz5Kmdo1/LoJnZLSuMAgtNPaascSImbuJEaOa47MuqWb
         WkH+jbYXcnMYyF7zhY0jnYrW5VZx8w4hlg1FpHZVVoZINIWaQDnB6EMMZQ7rfw43Dlv/
         E0z2GcL9n2Rd4uftw3PfWsGeQbS9C2+o/80ARRkRt04BS4uK0+/l+8VCcityehX5M/eb
         jIxCIJ7HM3Ugql6bdwzeaGNmlFWjNdmj8hsbd8w1fibS1GDauLjsJmt1rEsXusYYh0+2
         p8Gw==
X-Gm-Message-State: AFq9FYLeSZJwq7IEDp2B7atJKQTtWtRaGqn91m57GM+TB7ttqB1wIXfs
	KnDy8UWfNiFLHLxH0HBb7qQNg5is2YIVh15Tu3BsxIdtwIKecDarI0tDYCOQpQ2z2PutqvLIacN
	lhO6+LPbZKtSopKYG5xNX/6lSRuvc5FXrA9kPWBnpbZx82pkFnU2e6/8wjEuw1pa6T4fW
X-Gm-Gg: AYBFou3IvMMJxN5+CBmmwCB5ZBn/+3rrIREZcmo40iKJSc39jHFF3smwN4soaiYNVzG
	Hn+4nPXgWcUi3aX5DhYYvsGDUx9NiuQ+s9bJyR+PJxRHvgluIp2/wg1WtiA0xpr7Ul+wTIG/ict
	Z3ah/zm4RLhtuiQoiFUeuNYingUvd76ZCP+gy0GWN+9VZ1YGmxt91LicaOMq/18v2JEn56SjsZk
	rOspsLUxlSMynaHdKmYNpyx7g4aSYUStU5J3E/cmUJqzGq/5DM2dAOHCNOuvNK7CqPi5Y2gr65+
	KQDJX/ef8dn70EjRjx6hP0tnBvkjho5P2Md2OSCcbKR2+TuViIicD9FoHW+TqvxfcV/LZo+HfCx
	nYo5mx6ffPgWAS92lcvmU78WjDdaJ
X-Received: by 2002:a05:6102:2c81:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc9263c60dmr877612137.15.1792592649574;
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
X-Received: by 2002:a05:6102:2c81:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc9263c60dmr877598137.15.1792592649043;
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 21 Oct 2026 16:23:58 +0200
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP7K2GoC/43NzU7DMAzA8VeZciZTnK+2O/EeiEMWO2vE1pSEF
 dDUdyfbAfVAKy6W/pb8840VypEKO+xuLNMUS0xDDfu0Y753w4l4xNpMCmlFJzt+GmPipXeZkIf
 PISHxc0pv15FTa21wdDRHJFbvx0whfj3sl9fafSwfKX8/Xk1w3/5HnYALbho0ugVAAvecStm/X
 93Zp8tlXwe745P8BUEI2AJlBTunhW2hAeX9CqgWIKgtUFVQG6M8uAZbEVZAvQT1FqgrKKVRDq0
 2Ae0KaBagFFugqWDQTmLwwnTY/AHO8/wDVr3zhg0CAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1KuafD+EQPH3mdB6XnrkI3RAJydayvPTvSwodVvmMGM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsCe0HAnTl2+WybK4TohjALathuCERDtpeJp
 QQPWJ10H/6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLAgAKCRAFnS7L/zaE
 w4spD/4wYvzXkDa/jMjCnPdbV1e8047b6IzaUbYz7M5LwoT1Zl5X3NhkGQLWf4QeV4QH4ccxiT7
 kQu4pQ1iLcUkRh5mxEYpwgMomsSB+8KD8kGCoMB4nCqXJW0luA6OfTQLpGfesC03Shn+2xfb6dQ
 JO5h+Uev+WofgkB1djtM45Ql3z7Ee6oFEkq6574LorpZPeFeXEZC/TPBHbD/e7hdhEyq4W+TI7b
 J3j+Se0hwPotuHK7adh2jQxn/tEDY2RLXL0905Tbi724eS1+RAGTI/NdYugPISIra9HCTBh1WAZ
 gNmubKxrqQLrO3RtvW25JTjIsVIYrTzfDl7wosjl3i4s/+12K06nm5vt0p3ZRl8V8kFxaEsnL6n
 TmEEzVVl5JIJhdUN9NJOimHI8lg6mMHO0TOvvlxHAj0MpPQBzEnQczfKNssRut0TrV9wu5UaA59
 ItEu/0n0iBDLE2sFY5TdIlxnxV+Lpm+QT4eywcxrlB7FHMi73MpHQfQtkz/F+otw0+SKSyfpWKT
 SOIYOwTSLjSYv1QCdizdl3on+18d8RTCIP1aT3DMMjRbBgzU//UTAkcSjI4IKvzz625jfgI3j9I
 a//UiyCQHZYk5Ef/PzUt+kDoRPEPqG3mv3MM52jUJlHiVMOwoolasYv2hZJAB/3FFNYvMwBVFwQ
 FK/G1W84Kv07KBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8cb0a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=CwMrYGdqEC8KazAlSEQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 2jW0h70ifzXeIlWnh9x-f1jQ3Q-00A1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8sD8Yf5QxDgU
 VJu0/7iLynlkcPcUOjPD1UCaX9wV9Ael5IH6y9YCzyiYVu7+M+N60ZdGAauG1xm28G4FaeNpITH
 5Ybqqhd6giOH6/i4+trLqOqsiJ3B9JZENZc8Rwp69z2hyNXUzFznHEmEIijKzAVXirmmC5ElyM+
 GHRuyuZaXk+He2tzTZavqg3LUHzkHHRwz3431abztY3cmwyyCn1hvkeHkkn0qprjZbk5P7v0XLD
 ua7tPZp/cXyUAxj6EXTn8z9FfoF3A/uH9o+j+FX1GLPupf3e5cKaDsndIl6iRoZTB9nMsyp5ApU
 Ko43g6Z5GP0AQ7nfO2yCefSeSdt51jdlm9zv6l989fxnLnN2bvi0Rb6IQiKodV6nsZMWSEGMrOF
 GtHScZ8S5OIYKSbgWEV6teAaBSnGfsvks7czWb3ussNz6R3SHRT78GR1RyhciRZNzqsDNrmgdHe
 R8iaxLqVMyC4u/pKLcA==
X-Proofpoint-GUID: 2jW0h70ifzXeIlWnh9x-f1jQ3Q-00A1-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXyyNFEi/hz9iQ
 xQeRp2mi4oIppBffkNOT+Yv4Tq7zUm/aGFjhABmHA/AcmicMOSp+v/32/mvgc1b9l6Mq1EO034G
 iZ3dNYcwY1oUYgySZX22/1Vt+4BrJlU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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

 drivers/gpio/gpiolib-shared.c | 300 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-shared.h |  15 +--
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 181 insertions(+), 154 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

