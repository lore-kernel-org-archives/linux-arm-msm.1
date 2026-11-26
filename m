Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688473;
	b=v4t9ZJC8rTgKB4PP+Msx9oSeeAz0bidnzWueOisKAQhefjcs4vGdW3Ha2RsZt9nl1GvY
	 tjH6k2LObnmKB5Q8bmn439BUBD+DRMB4oGRx0/JGj6ZoAlmOrI5l0jBfxQ4jS421diiHh
	 IjqqFLCYYlVM/cW/85oldn2/MLYJED4qGNpbSfJxjarrSPSnKkiHzkF60M9Q0wpVjgTmQ
	 93iuyPgBBQ5wQD7p+CsQFxxfjXVcX6bI40hvheB9rMCZhpqP1vmbGn8XYbIPm/TkHy0kD
	 W/dSQcsKM0CamQJbYDMPO7ElogSlaQ2momID6oWrgEcoGmolfx32nKFkmJesjtDiaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qoiBeOqQVNoU8aJNXpKrMyC1p4sNgoHSiwfsQhboqoE=;
	b=1jAzUYyKtxtJD84JHcRMvA2djO/1IXl0cRBd4Pm5sAU+/ITpYlVlZjgBEZD+Eqllup23
	 flSbH9wIBlKN+deu4+GDcnDsylTnzs+AXROJ5O7PMK5zK/+2rVlcuEmr4IZrKEU9YS+Pm
	 wdrntLdx05YuTadJ9E6dSVEimGJVWhk0UntJJp55vn7EQ3GQFbskY99YTfCyQsugroBZ5
	 YAbXAArBCjuxiQCUEgXLv0ZrRpD9MRoSNSOiPh60ws/3Fvz9EN2/PVzG4p1Uug4V6E52O
	 ktzqWIikxTEed+GOjZFteG5WJN741kHf3XL4nSiJio1mX1JRlFklT9kOjWEDCtUfgyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HZ7WAs7M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WtzCquEY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA84606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HZ7WAs7M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WtzCquEY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4WL2175787
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qoiBeOqQVNoU8aJNXpKrMy
	C1p4sNgoHSiwfsQhboqoE=; b=HZ7WAs7M1TXGILydjNUxEdyCoz+UYO0QXn0BiI
	fKZsYTY9DHGT/o1mGTg3OcwrJum/PcmwnNcjn4xEqJqXn5lvuI9fBbNp1fQTtXJ7
	QOAsvTe67NUcfcLoMJr4lkdTWL1XyI4vY7H64BgIjqO98x4Dg/FWY9H0dIcu9ssb
	5fvIZroCVIUbxzVd6Oc6dwk8JkrcHMLu4AIb3yYce1g4PsaAfpA1rEHz1ddBUdON
	TGa8ozY0hb8YU7paEhXI6fg/jxLDWxNSSMqKbh8nFC5e1BIdBbUHxfICJnmTsPj7
	U3NFInDFcqU2yyn3j0NB0cR0sctGqbtZ66fipmH0ehrKlX3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuytu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:21:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94970ad532bso488357985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688471; x=1796293271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qoiBeOqQVNoU8aJNXpKrMyC1p4sNgoHSiwfsQhboqoE=;
        b=WtzCquEYErL8M35v8c0rwT0DaVQFadHTpD/tiVtST6zdv7FQ1q2EU2DWHS18z039sJ
         rpdXOp9y26fLwdUUOk3+c8kMd5wHgOKGR4rF3xUdUlJdia+AUIu2QUmvZoBknoqdHVd0
         fn0qcEIF8iSB5CG45UAjOVd/jPM/4XT4tHBf3TyGRzNe0GJVYv9x/fsLyfYbVYVtsjAl
         ZKVpC43WJWi6wmW3Fz7W26nF+nrC9rpLyA0VS7VUb7dE6hZS+0m2GfcHgEJo/nfzGOkY
         jGY2zjG5+cxCG/94HRuWrpH8ckuuckvybZox4fe12k2qmrPNI93J7P0oHqPZLOLDWuMO
         gxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688471; x=1796293271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qoiBeOqQVNoU8aJNXpKrMyC1p4sNgoHSiwfsQhboqoE=;
        b=0l5jDSclz6k7fdabbQDwkn/YKxklBaL6ZzLb3MlyC3g5xHHmIkPuQ9N783XWVri0yJ
         Ouik0vXvBwBmjHe7rvSJSSrY4qoIVsYDHfyc+wmzLULg8fYqjEJBUPGnKoYm4txzv9r1
         ylljSGRecVWBK1yD1pr/jO7lY58t8TqEnNxjm7iOq0dGcS72sGw9SpHWHAHD4ndvK8a4
         vpJWR3WS611xxXKsujHjzG/3Bbelqm/xr6tEnXDbDV8g/Is7rXOIqlRfyqmABMMTVJUX
         mkzFm2EHXlIX4BNAnuKcIQKBxn2STR+YDXRz35HrTwcRm5Rd4SUUilzmf82tn3Hm6rh1
         RMZg==
X-Gm-Message-State: APuU4Z9EtUxiCTbSq3NuEtroaUe1kNeINJOO5ImhOmLMG58ZkEgZq/mu
	gpFRXC8WNRusWpgUCfegjB6DN5Wr17qXGcooyaYXnZrYHkABZsT8QMF8cEAALYGYK6YTn/v0AcK
	wUzCiJmVHGDrmPCrkWrFximWeCaWD5a2U3A12PNxtm49Ldvf7Lv05nChjYPbNFeRiZPii
X-Gm-Gg: AZFdTZfs5DLf6KN3ifxEehbXHD913awB+OBGboSGA+31wbet4Ng/Ddi63iq+VSf9l/O
	9McZEKWCjm6Xn0+bDiwA6FnnrSDt/RLjD6GjqqOopfbHRjZdNWTuiNHj9jhiVAV/DlhHibGQVwI
	hvO1aipkIlwtCRmpylS0u2sf4qDQLN0LxB59zIFlz9meoBHd9sPGVjq6Os5Zx+PKiuhFhU7YQxV
	msHQg5iB0LwjrYm1I99C5m6XqdvtOrXN9tSH9+WKArU+nITEjvfugt6xumVSINFqY5E2BxkUNmL
	uhj4GlhZ7pl+BC7KYfrrsPG22mMZnO4ZyLbnGkcxTT21HML7AyoRm8fGr0+eTzyGkeEUVT9HM5j
	7ZcW0T7YheNCoQpwuQHQdSyEBcU/Y2CKOnwtvXLm9RxtV2Ts+6uiq/aIy0HbC51zxaMMk2j99Eb
	2bm4qi6eTJ54HUnuWN1VL44GiingGXgE4KoBkTSfMBVKBTkV86K47HhrtIt8H7pPA=
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr3328273885a.76.1795688471070;
        Thu, 26 Nov 2026 02:21:11 -0800 (PST)
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr3328270185a.76.1795688470579;
        Thu, 26 Nov 2026 02:21:10 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] pinctrl: qcom: fix and extend egpio support
Date: Thu, 26 Nov 2026 11:21:04 +0100
Message-Id: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABAICGsC/32NTQqDMBCFryKz7ogZfypdeY/iQuOoA2piYqVFv
 HtTD9DNg+/xfg7w7IQ9PKIDHO/ixSwB6BaBHptlYJQuMFBChVKU4arNjFYWvbkJebBikNKO7k3
 Zpm3OEIrWcS/va/RZBx7Fb8Z9ro9d/dy/c7vCBNOsJ50ULRV5WRnv4/XVTCE7x0GgPs/zCzLb8
 K67AAAA
X-Change-ID: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=66+aAGMG6/fPdYIs/CBXWhOipwgEcqKXSc0p9m5j+OU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgSmeILe5jThkGkiayC/U3Ob2PzyB32W/tFW
 IlIzzBYP+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEgAKCRAFnS7L/zaE
 w7iYEACay2URxqz5dSxqO8cnecu+sigR9ynr84ZP5R/u0YGirhVkyIdZKz8Syoq0mcJpsR+Qbft
 G4cOppANAwQnu3nRavMDdXptY2EK5wcHt7BEvPA6jB707bBMhBENQeqs4gOGH8bXnjga0j9rjkI
 AB8ZgYU4LyrG9Az510LTazZlRVool1mqNinudFLQRbT3oVBGuMbel8C2XYsZJO5Yx2AmqcxHLfz
 POJCmABeTfQRAqVzegXosKIflWNm6itI2XzWho9uDMAZ0ip809YZVKD9+dTiBtOoGkM9MVpSEsP
 lbQgWUlTKL4btlP/E9kFZwDG0QCIDlLAZb8cjAnswzQJz5uo93c7P7JVw5JxEHLWqFPaAHIB829
 QCN/2PyTY3ez7UxZKZpJYZAfuItMIQZKLqSXqPrtBjV4bZJSH/HPCMX5ShLM8baUt7hbk6Piqzr
 1k14Mz3CgcAoSE/EeAZw4tyVfQvLSUPOMmqPMZcVNb3KbMnPGJntmraDGYDMyU3AM4m0+sofUkT
 HZZ6zLhY2hDSypotGMwuFiFpJcoRnJKjVFkjnPVShQF7z2L+F46WoY5riuLE8jJM4Hv+KIV/unJ
 z58LYFKvqsTwdt7FSKAKJgykBUzbiTUpmIzQCLJcPqtS5AUDgUu/A6ypMUGwu0tyahgS4Qs49ju
 epNs3lzb9AFgJMQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4udVR22l38K8NK_MzQAsIHkcMkbMOB-5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+hnvi58BAi/d
 Tbt/SlvBfF2JeUfBYDA0F/5/oJWeihbf3OfhWqWfEH4unaQj2j6ycKSVWzeLRzeEdNoQaPwkCyd
 UuRf46+ZoTlYR6AY0LdqLONT+jg9z3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXztS8a/RxWHeg
 pzj76IbWLeFn5rThmWZsf8hfAKA1ivJ6DoDkyOLr/kfXknr6sEXybSo2Zl+e9IXjPzU0DM9NvVX
 tgTOhHv4Yw68iP54jyEWIozj73fOGLEj2Q0xu6TzwPl/W9PMYjfaW/qtHak5afv0AztACP/UuhP
 Kpmt6R2+fuuqk8aUddNZIUUIo4CB3vW5PQ2MDg6uvLBfeq4aTwwt8Z5aH0vJYOcQQQdAsTYmEM+
 s7NOD1FZvElvgX8BQ1QzxVqdN8ZHwRXYis7tsh/+V4IL77NpZ36flnv6O/+tVDg9GrSoKXCBvru
 QTXCZkg4Mxo7/Hj9gm7AGQm65zInaUqqrcktl5S40Y4xQZc+p14M5sAraZDRUXdMcLVYzxKnkpO
 ndYGWwnCZQzXjz8BriyAIYrS7OM6XECure79poYQp10PmXLIRwCp7Z4IIZwycbkq4oDOkvo/gdK
 UlvbhdyN41gdXd/pjXw==
X-Proofpoint-ORIG-GUID: 4udVR22l38K8NK_MzQAsIHkcMkbMOB-5
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080818 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Q4R59cM0UI1Gu6HzFF0A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Several Qualcomm TLMM drivers still register egpio as a strict function.
On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
series converts them to using MSM_GPIO_PIN_FUNCTION().

While at it: document egpio in the sm8250 and sm6115 bindings, and add
the missing egpio function to sm8550 together with its binding.

Patches 1-7 are fixes and should be backported. The rest is targeting
v7.5.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Reword the commit messges for DT binding changes to say that it's the
  TLMM controller (as in: hardware component) that provides the egpio
  function, not the logical pinctrl driver
- Pick up R-b tags from Konrad
- Link to v1: https://patch.msgid.link/20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com

---
Bartosz Golaszewski (11):
      pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
      pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
      pinctrl: qcom: milos: mark egpio as a GPIO pin function
      pinctrl: qcom: eliza: mark egpio as a GPIO pin function
      pinctrl: qcom: hawi: mark egpio as a GPIO pin function
      pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
      pinctrl: qcom: maili: mark egpio as a GPIO pin function
      dt-bindings: pinctrl: qcom,sm8250: add the egpio function
      dt-bindings: pinctrl: qcom,sm6115-tlmm: add the egpio function
      dt-bindings: pinctrl: qcom,sm8550-tlmm: add the egpio function
      pinctrl: qcom: sm8550: add the egpio function

 .../bindings/pinctrl/qcom,sm6115-tlmm.yaml         |   4 +-
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml      |   4 +-
 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml         |   2 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c                |   2 +-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-maili.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              | 105 ++++++++++++---------
 11 files changed, 71 insertions(+), 58 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

