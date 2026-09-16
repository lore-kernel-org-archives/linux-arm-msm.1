Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA44F4746
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567173; cv=none; b=UP/zBpPF1R4jdcqhV1ML/Jsg0A9tyt0MuAFHjxgPEf1fHSQy7//9gUtOnHefvkNJ+iUAWb3dk+i4Wx18v+cdwO/zBFojgcC+FyWhDPpyWQD0BkxJ+kAhtppRBgc6a3tyzFmPIcZ6/X+ZuZ+ugYTTmR6UwzhhFicpZajxV09syjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567173; c=relaxed/simple;
	bh=O4ATV4tEjSWiSuFTbC7ZkIp7EJmcpaPTV5+Vb/a1eTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BwIydkidS2DiftrbHSbtmFk+DNrB2czA8GN12gZ2FrVAfTxhRQy54NrdykWOVzN5GNp+c8oHGDmQMmIHLLHSN7hVtqgt7mmRUmq6F2WAHCuhb/DBQ8+lA2bpDPacM+vqVHfrYjWXP9mS/hQD55ki3GM/b7MnGrcTCPKLJqYMrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klNYYsHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdA4QNE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klNYYsHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdA4QNE5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDJhiE2283704
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PGHhOzUSTVKuhBgrqd1K+wKKiHk9NN49yA/
	C6cM552A=; b=klNYYsHp6jt7v6zWrUeZ5M7Rvi1TR6d1oTwkBnhQpBoh4V/KQdW
	S88EEwiVa0SI6LA1cFbA+dy3iLlU58HO05M/9I8ny+j7vtfaXFUpEMe++G8D+dsv
	zpEsJ07bUWNS06fny0vRUuD5xddKZ+S2/esoO/CfZnBg8pYkw3cal4v3nI8gfMCc
	INM9Y1vLT4+bh49Bh095DxixBbhVoci+W6kiZePC2Hv1gdERha5WsRfXNgpicIma
	32TTLGMzHTUYBi36jw1r7+AVR7d95nnSvYMVssbkCtCo+H5wrtWJxpWF8gX7KKzm
	GJseE0mcSwgQiRNzhkvjV5lKE6h4UQqql3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb04yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:59:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso63866455ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789567170; x=1790171970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGHhOzUSTVKuhBgrqd1K+wKKiHk9NN49yA/C6cM552A=;
        b=HdA4QNE5CwKGKj9ATi6y1v34qUcffA1wjlsNIcAYXaHCEcmQ3NNgI2tuYEbRKNwVXl
         FL7zzYiQHI0e4CgYYaitPHN6lB5tl1OG3MJJiC/izVCNDq44E6kh4+eT8MFXAqU5K9h4
         5Gu/yv/fOiwJCD39m3MYM9yuGJTwNcYZ0QybnN7eJ72h/xTTCguk3clYGeQBRj+QPD+D
         VDXtLtlpVwvMXVz4lFW0y5HIcFtDD3JWR99MqU5UTqvSO+HLLE1lg5TfE/uUs2F4zGUA
         +WK2XEN8Dg/PMjhc6e4XrO8glhpzYdGml+ukuddO1KxQMwIqZI1yaR7CWGdZPLBV+SwE
         y3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567170; x=1790171970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGHhOzUSTVKuhBgrqd1K+wKKiHk9NN49yA/C6cM552A=;
        b=FKZsB9B1dztjUkE5ow6iEC6IlA/x19287Te9FaJHyvn8HAouQjL7dEwOGx/2PEZFEn
         33qY3FWBQcGU8FnmuDAc9B4VmV23Az1fnCnulawLm3H+mipJkTuzyNZPYfJ21VFj28ts
         kJVUJnmhevHlU4zKMLdb6dpmVLXEIGNX1jEjgLQ+YYMc8BxHVQXUgjyxtADkRX15XnmC
         Kc1PxBKswiHc1fYwuIg7vhE6s9rPwI9/Gd+Dr1kIV9k5JY4kFkb5aNgNFk9qXcCOh381
         ck7qZ689tv+RTNtBuA4BtAqzyCKTMwDPUe/4UguxXCZ2ksd+gSLeHLv/sZtGsgIW0J6t
         QScw==
X-Forwarded-Encrypted: i=1; AKwUvBxF68rIId+7X3rvrq5tPa29pbdGnyjgbHYupo6wSH/f23ue+BsGwpGoZt7LJXAjqeuFq3WavEGO55o3V1qL@vger.kernel.org
X-Gm-Message-State: AFuF++nlkfT333ZQE3FDWaYSESMzvXBpwpUaoZcPhWKxIdxQOcUXWSQF
	9bvAPRS6sROFqjO7S1pdZRp4eMup9xXwtXhxz1nNy7MGqRzu5ZWMFICeYYKeh47HUr0Qqe4IK6G
	PrByj1KaA9qsvtusexFEZ1sD7/anEPfHbtO2uRWtWewpHUM2XoqUMTlHQBa4G5JR+fB95
X-Gm-Gg: AYBFou2/RvV0UIHqxQc01cNX6X9qmEa3Ikfr6hHUB/iSUvbpgy0I1kx8Dsq/jDH0M3X
	JnbnjHXd3jMJVKsX5C41fncsGf6BlOMzUf1KZl34WUgBVdElh4ucUaCleFoW34CQLjSnEAQiM+l
	I7OUPbvXygSeEeVXZEkUDHgSKpBIfycEKLRLhMBAONJqNaUH7aSWSsO2iF40tpo/qigiFlY3oM9
	dpoRU3T7S0XR6TGL/oNvd53Fdq7wSB8n+SBj5IdrzEgxhVzx2Xd4RfFRMdKxHc5nqKocklJI+yp
	PlfyTrDFro4Apo0NzG74lc7Yj1OLU4j/fHN+EdNKkA2Qd/Ip2aJ3V73ybfd3liiyUzusgwrhLIw
	ztbD7Kg0AdaQqa9uRnwqQRpJ9PEMgtWgXisgnJ7085lYE3gQXZC8d3LRJGZ1X
X-Received: by 2002:a17:90a:501:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e25c2ba53mr2266365a91.25.1789567170137;
        Wed, 16 Sep 2026 06:59:30 -0700 (PDT)
X-Received: by 2002:a17:90a:501:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e25c2ba53mr2266305a91.25.1789567169662;
        Wed, 16 Sep 2026 06:59:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm6507940c88.9.2026.09.16.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Wed, 16 Sep 2026 21:59:16 +0800
Message-ID: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aaaa0c2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: i4T8dgptkCOqe_axe5Yyus4mmRRZwjjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfX1ITONFAKIjPq
 L/qC+aw1E7eIVPNJUH3niwnWRBS+bH4TTG7KsVNtVIyiQDHR3Rn/XiNCIRaIoGr9qD0z93EEqXF
 f2GME6kxfugwLnGp+uj42R+Q7WIcrERN98o2mbFYrd1qdOCX7FkfYqeDc4nAXv6KzvTPjNOU+lt
 Bbekqyj2SG54tUQL1Tv+g/257hZw/KDBU+W7JDhPdwp1mWxwHfgsam4t658E8a4lgtirWCrh3BG
 1WNMe+85ry4GgQUbj4zA5tQFAvimQBzAiVE/4OZ8+stM4MVESWvRHgtfmPVZDnEDm683AmgQUC9
 ZUOMTZk5au54iWoSh6mWruOYadsrDdwyUW0BhCB46SmXpZssRVKxZG/AJVcUZ2OGHJUmqWwb04i
 0NZNqefxhyje+MsE6ALBPXLF5BKA0h01bMNLVmhjdBeNyWzUcDyOWRu1iG8M7pP+bxKT4tNRS6+
 VvpM/HegGjaGyHeoM+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfX5oLrP3+KTzRE
 /PwyJQANoOiTdJ7lWT/VataSZb0uvss5YDlqEkD+ICsLL5t2ezSWd9mXl6k/0sSsvS4qm+rEvRY
 LEFvqEi9rZriZ6bZyXNCA54d3WP7XsY=
X-Proofpoint-ORIG-GUID: i4T8dgptkCOqe_axe5Yyus4mmRRZwjjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160188

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

