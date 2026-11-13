Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558046;
	b=rJ2wHk+KHA0wDApZTR0QtyIkaoGB6uRRM3DBiYKGzcPdx3pZaAX5n/zEseV8zSmD6SZO
	 fuLN9LG26oxBI5ZPYYsdRcKs3exS/eOdGZ5FuqQmg8pCskIxttUtmKhazdmeCCA3n/TW1
	 uG5NeKFFLC3U6C92KNuTlJZDcuqQuX2BGckr2Za+3uq4IN6i4MkaaAqxh5ApvPq0up8Q0
	 xPgnOB/dfc+jEDvARF2friP8qT8q5L6I6B/M5W38vutmyXtJFuFbYKhFQvMhM37YtY3Cj
	 ylR/6vyZie0WYrgnahJkroE4AdKMEIbnvW4Uay8RUvE060WW301awOHVT6fd9eKyDlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
	b=2OatcAzFEtHyfoGltH3CpwjRAYxbc8gcsgUkkLeAfbTgWLDvYRNggXcYkBFVXOcryJK9
	 bhHidT5cXdJi32hyqb3YHIBzHN8s9a6Dn3zqdhuXVTx9qfP2BH9YZ/YElTG2Oja1ACE0w
	 t25zX5Re5K0fQvScfAYlw15y0bSFzb9pRv+zQaaLsZJah3iA8fUWdr9Q143RJ721PHns0
	 He4gim2PdELvsG1xh2PmFigejybzw7AzLb+JbL/Ezeqgte+zV33VCHW4jBk6aJZNU2T/7
	 ggtGwG0y9loXDrb/A6g0UKH+BSAJ9oTiiisifXzZ0AzULnmr99LLF1V8A+m9jD9dxDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781E606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9781E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57W1N3120260
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+HhukhZuFpUmESx9rrAxl
	UZVKyiO21AXgcFpUXvUvs=; b=ZdXx7Gw877oUzcqjI/khCD4wl/8tumGoJRseaD
	dp31C2d2ZuAlsev+5Bcx7FPzZgzlQJGV1W4pSgfBSp1G6tOkuNVzG//4PHRObgKu
	y0YqF+ohHJASIbRtbV9cgR865nMJ1RJtY4QkEdvk9WCj6UFMIa/2k/Q1UwQOXb/H
	ZvOJIVeuKbX4i3vo2UzZOa+hljTci6ZUd3BVTEXYVrU4HEcK2zAxR4HxzK27hXLE
	0nRkgDEeTdJzAiazoKxrZjHuMhzSga/f0KRkfzYjgPFNK5KPseJCduuB8yAcDjWG
	1EwIdDfcprBsyxhohO5dF/2SfP6V1v0+8a6nghMIUh9DtZ+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa5p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso972063eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558043; x=1795162843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=XviP7BGW9macQtt8bKsVdFJZWd3zkZrRCnMigzK1JPzSuzGEKTh4TkGYGfjOkY/nkW
         LMaqVziN5Q73g095hK8NYt0jH1hI947ky1DeWht7fuNkvZ96gvHjUmmIQkEMn7n4xSkp
         bbDtjNuH9N6hotZFHQnCmkCXSEkh6yiXLjdGYL0VuKi/bv9cnnJhP1dA6xe8R1uPS+EQ
         ndk4/nZCznv+b1t9AxWcPn+f6CUHDipEzFx6vONt2Cr3vd6JGORD3/6faA4Ugjx/FOG2
         xOQ4jW5rZj0WEe1zMDp175YDrleZrF83y2R6zT9CMst3MJpxJxbDOlw6G84bT35pwL99
         w/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558043; x=1795162843;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=wDlO6sGezGlUigh0TfcTeDiwU0AYCIVgY1Z2kD6wtCSL06LNFAxuKxixCj8vkrsyhF
         Pk4F9bIKYCShdN+4KlVGsX//HAUhgF34djwv1mCjVkXp73bljvCqCxPBhc/dacVl+/lV
         H2Kz9pvKOanp/2hV8hgyL1kWltenzBwzsf5yX0VhIJb6hGHh3ZCpZSCrn4O89DCQTewk
         I3tvsikh5+Ob4jqzt9JwhSFpHN7Fx6sEi4StDxrLF1dOopv0aem3/wpMwUDGz5qJ+0vG
         i7dWVx4hQesKiieai1q+lzgmrecJsyUF62tl/pNvAoKYUJ4QWpXH7A6mzDezhUavDSvt
         g81A==
X-Gm-Message-State: APuU4Z9OVt8lsO0LW57ZYSAN6QybR8fzfn5dXNTGCWx+8jUKZJQ6DCRb
	9rBjIEiPuNublvH0hHkjSlAiBwY6DkxW54PCblw7TXt54iQ9eYyeSRzxHG7WRHpOH52Rf6ni8ej
	DqDevSWc3dEka2d10zKD1slfIm+52WuEZPlcfQEZjH4S6cZ6wEjw1jHRoj+wQzSbaZPdL
X-Gm-Gg: AYBFou3YrcR45nTtq6hUydhTZAbriDNh5KO9IBl9YQ+UT6DfzgDBoPFb52KWS6/eXYk
	v6oFb2KamTVyfQcTCrAmaorzdzRF3u7BDGUJ6p3EBfz1Cgh9EkKJhBrwbW6JfM4q5KCwNJVZuPk
	b9dRfmKobbPMhDqzmwQ1XNU96jbWxpXY+hD1O4TgbkzQMAZtz7fZG7zXbTpnKRVGNqVttl6jXcx
	2fw7qqVLtQ3D2ZK33SPPIVJ4D/piLc13UQ6uCreIDueBqEeGQfWWoLI3E0u2VIqHMlxGe0SqgXx
	aUlaz4UAJwqDAnZB/Rktsb+q876UTTvPom7qKShNQwoep930vNvWeBzIMHuvzzvhdgYy35lwds0
	Hby2MDM0R/543YT/iCUL0eDVtgU6hGWe0I/w0d5C/fLb5Z7IeiwOKeMyPRhvVR0LokIcmHo8on4
	ohP1M9
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176110eec.29.1794558043334;
        Fri, 13 Nov 2026 00:20:43 -0800 (PST)
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176086eec.29.1794558042788;
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Fri, 13 Nov 2026 13:50:21 +0530
Message-Id: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEXI9moC/22OywqDMBBFf0Vm3YiJ1teq/1GkxDw00JiaUamI/
 96o224GzjD3zN0AlTcKoY428GoxaNwQgN0iED0fOkWMDAwsYTmlCSPde7WzfwluEQkVukx1xrO
 s0BAiH6+0+Z66Z3OxV+McrNO1hJajIsJZa6Y6yuW9ZLIoNZcVHPe9wcn59Wyz0DPw//FCSUK0a
 HNaaVGktHo4xHic+ftwx2FAs+/7Dy6mUtffAAAA
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1301;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZIVdnv/pVYDJ6VtZ6cVcvJh54NuXewcKEXwu1xtFH1Q=;
 b=ezUhCnPza1MWnKyzNnbcZxiMALh33SYPFT4aqKXPshbyjjRg7x3Nwlbcpd0iqNPft+UqOp1Qu
 2ckjaTSNqZSC32kw7mcM1REEM1GIN3Bi489FpmLStDFe8xQYpoJR9BY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6c85c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ZZnJuuPsQdHfkcqpShSUE2ENIYoP60R3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfXwJfUYV2o7p3w
 egg0EOJmuLIstQUyo3v8PwaT1HdpMoUUQyviiVC23l62eH8EIIS6C0vtcRHMrhqmIixMwNycU/H
 0hwaAhnAiH+2RShcGEWhPTP5t/2+RD4gAMGsh6fiKPoLILmS9jQyjzqzHf4kk5zc/uV8ot06Uee
 PQ78LGmwQe0SXrcQHWo6nJlvOvjAmV1Vwu/bOjt95fUrdmW8pF2ekoTe3o2NtfyqNUZYPRFKkST
 OtQNRZ/tQZ5VgwFU+W6KdERltOocIFFFS4twy3/oQ8kOPS0R775LRlBm57g7drwegZwLq8GNrix
 td10WHc2JSP+4/OukfJcaQe/kVzJKzdIBSNyxOzpeDPJUGsfMKykGk92MUFVnmaeQoMjLUGH1iR
 y5Ru3awYSsJbBosnVMYPpQ7O8zMK8xVYB5xKC0xrA3K4YehyC4S1YWmEq4yrz+A8k8zoYCHLCup
 n3Lr0kMoIICzTQpTrdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX2+aadCFeTC1h
 +63laJ5aItkiZZ1CnJb8YXHZfB6mpu8Z79vAbDd38rPFSiTsmzIeGavC8qRu0sP2bIpeSy6pXzw
 9hXNUGm4vBqBe7RKZ52kqAyqmeFu3TI=
X-Proofpoint-GUID: ZZnJuuPsQdHfkcqpShSUE2ENIYoP60R3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Drop port@3
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

