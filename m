Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23F472771
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118655; cv=none; b=KBv1QUNNxoiL0opVOsVbBny/+bUHdjLD5HvNr6pLD44wx/Cq6BYURCRBz2ZZv31IWKajhz8yYRJGKSY1+KX2BRp6EuMiUd4Jpn92T7AQmxFric/CaXa+BotMBDfEbty2rFMU2RqHOUbrzlAJEbBlAzBdML1h0Z1kdLzDb7jhFFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118655; c=relaxed/simple;
	bh=5WthjTG2xxpTxvfqn9DfKN3A/9y6OFDPyYaFEWcWowk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sWcEl2ckRy2MZqzk2v3FB/LN5NZ0/XvJQovuK4Z3+JnivUMIO2UoNyy9Wan9FOlrIqJCZZeXPJ6Mjz6MOgVPpuesAa03lxjdMcrDLxZOmpz0SkOOjrwOHGhew23inFcjylPdY/5hlAwjIulL5uwi2yAi80yRpTcC1bq2b9fLmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKhvz/Bt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCZSUCQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKhvz/Bt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCZSUCQO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677FRYXV1418441
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nf3EsI1y9Y4VvhefJ0IVqY
	GkYHIBiRVhxPHu6hseVCA=; b=DKhvz/Bt+HiHHA+gDEuHqDmux9Y86PTOQNxGEg
	Z8fY5+tvGyccYHPXPOzqhLgAuroPi+8jvDQtl3XzIDYcdBVML1bfxPb9MiExX8TN
	Q1m3fTtrvvJg0ckqv1xiNiLEYS0rBc/jInZURY7vTfq3UXToVJyasbfMhgUR7jzM
	QOrjLvVpa1nRsYnM3jESjUlld30KRKdbYwSQJNumUWHY86o4tbkPJpiB7E9eYYjQ
	XuTg6rIhpUyJDjMIePptt4n3hcBOrxu9j6tiO1XLk6HYYJ9lDA2+IMZAgqx/n8en
	zHvzQ6dnqWaRjw0KqeDCJTXWToZM32AlEYKP8jU89dj2M14Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwege153w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:04:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5278800a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786118651; x=1786723451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nf3EsI1y9Y4VvhefJ0IVqYGkYHIBiRVhxPHu6hseVCA=;
        b=BCZSUCQOu2EZgZ7a5e3+b1DAb1Jd9pk9t6zX4/3VB9dW8ktgKWHc7j7H44e42jcgrR
         PhdDBwV54iQVoPOQSZGzLZ1Q4TccwT4Eew0M4VYUEgDTb+c0s1bxYUq+fbSjCEdecQu0
         mk8BGd0319xB0eB/7Dhsps6zObM9aMp2QmlITgFxnycGRHgz3cb62kHEf5X7xQdjXDWS
         1r+xIcfJslEHy5wedT+ActpSFN/deBlUgtJYqlcuLKxSmb5GdFEVAyl0bRQMMeVjMqiD
         uRVtus4qzTACL4yGq8dsTB9EAeHn7byT0BHT4KEF+rvHhKs7qn5vrH/Q5MZWpQMAiMzr
         1p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118651; x=1786723451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nf3EsI1y9Y4VvhefJ0IVqYGkYHIBiRVhxPHu6hseVCA=;
        b=CxWjAesksGcDMYkN098Q3PrvYxyDBUy/aPzWJYnEjG/u/+Lk0HRZIUZ23OLh6zod/H
         l0+zDUkaaVzMRahLvxcEWm2deBlGxaXTsziG4SXJa+Xef3XCVa104zKhoICUYMQA0Ra2
         /O53do7A/T0a3D0prQSv3oWiUBKCLBLx+VSAOGVEGeAuYHEPB3IcSUzMCQMkE1JCCfvR
         D7omMzV5XOCFjfz1Tsf7PHa/z3GJcbIbyp+sV8LzIUC6fzBqPyF1wug+XOJaAv4Nl5Z3
         5cjPwBXd/u8c7k302spvV1LijXLQy5kvy5p79qQf6RqodVR9FufaCpPnr8SHMwV+LRE+
         FRNA==
X-Forwarded-Encrypted: i=1; AHgh+RrGJR/wUHBlmeYk3SIsCOKhXHRjKuHcbgfSVYTJOYpMGqwhV680meyG5cv3nPrvuFVZhT2mFRkVZGcBlKvd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8LgXNfgewlXnyCtwKp1Qn24taaiVhdolvt7+vGGB01uHtU4fA
	oJ3OmxEiJ5cQI82JbnyTs8HsnCOiMev4qSlriZvPAQxMSFDOPyN52qRO8F24mtzUiObk8Fc5vsf
	7r3XE+EIyfIHBYUUrcg+5ixe0XbvWk+pwNjXwErB0Dw+gukGUqdxEZN5nTcsrRQMOlXWq
X-Gm-Gg: AR+sD13WSy/RGwR69JsbLKH82vTDBzDyI63FjlEbhVgxwuceUf1CUN1PyngKE5Hc+Vd
	I+80HXF5cG8ZSt+msX6MhLdG/ro26o4DAb5ece49+u6D3FJaNaVi1rwK7ZeZNg/xE/aUUbAG3fk
	osFMFSiN7EJqvVnVFhWmt2bzUdKxpzLjr5fW+A1vgG0KSvF2rsKHEgsCqg6fmg1GdQZYMqP4Bzh
	J4+ct1KPFg6eXbhOoocHeKOfC6Ypg0botsCW792Cj2mZKm+kmIGRsuY8DoYAg4YVj3AO2879Ust
	MY4TBp73vjDKyzvH05onODaOc7P12p74Qd3Ma1cySZnPOh+9ela+UnbzJbPp9ueU/Kkl04JFNbv
	Ow0+ef2ZnqMphX1sBMwj3BYWbVs/5XjhhKJN3LCKGV++gbYZa7zXS0BE2AvHSnRAxK5bSG7XGtb
	3UZkGv71vrUCY=
X-Received: by 2002:a17:90b:6cf:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-3903c598e78mr25724486a91.6.1786118651240;
        Fri, 07 Aug 2026 09:04:11 -0700 (PDT)
X-Received: by 2002:a17:90b:6cf:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-3903c598e78mr25724394a91.6.1786118650680;
        Fri, 07 Aug 2026 09:04:10 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm8337541c88.2.2026.08.07.09.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:04:09 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add quad mode support for QPIC SNAND
Date: Fri, 07 Aug 2026 21:33:54 +0530
Message-Id: <20260807-quad-v2-0-8ec821e2f22b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoBdmoC/1WOPQ6DMAxGr4I8NygJNKmYeo+KIQVTLBVofkBUi
 Ls3hKmLpWf7e/YGHh2hhyrbwOFCnqYxgrxk0PRmfCGjNjJILhXXQjE7m5ZhI7W6FkJLUUJc/Tj
 saE2aR32yQztHWzib8DQeWTMNA4UqG3ENLBlvXMER6MmHyX3TG4tIif+Li2CcqUJ1umyN0CjuN
 lAeR+9DmscC9b7vPydIfobQAAAA
X-Change-ID: 20260716-quad-ec2765317214
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: DbH7DzZ6WxgfsWkl8wSBH5pzo3SKDBIK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyNSBTYWx0ZWRfX9lOJ6bcjRWr/
 iXYkyU1kjfhzoqrAYDNewBuqBMDtVCJhdWbg3xEnj9tEqtHmHrw5CV4QgkhB0Cfz/7v5e4kkTaa
 BDn6ypg5ukEbQnEhHe/HQok7uTx0m8w=
X-Proofpoint-GUID: DbH7DzZ6WxgfsWkl8wSBH5pzo3SKDBIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyNSBTYWx0ZWRfX4r+xZAjVGPw9
 M05GTDIVQ0ysLGI1j4rEb/JPenMVVaWvKkZGXGFQ0Otj5TallUdel340RkSZ2hcK2WyOs6a+2Oe
 FQwLUAhD7vnlhA/noeRfPFhR8nDuAKmComZPjjwpsclfzl1/l+3mBZcXqoTHKD7s/pn4yCWjUqy
 DLPw+qmpqzfdOqWZ/L9s4RGZX6AuOe9UaAh72w3tv+lcEWrm3YCJR6Rlj2x4SQ+5GLgrsMxYccK
 nHUl22qgb84OQ6mmtT+BvQ6ztlbZm6L3asc6J+xkKOHSPAwHS/9bsGI+0Y4W5/jnreiMAbQ2F6O
 Fhmx7EeVemMzEQxIPzp+JxJyuFWyRUvq2lFg20gQTUb9oYANHk6DqJKzMdVEPgkAzt/9T9fJjTa
 VR7QprYwakaQkPfBcatgywoik25Xrow/oOHwA2W9ZqIQ6USliDGNpK4NP4bbol27IKymL5eHWvb
 oEoeyrdBfhaQQoRP3vw==
X-Authority-Analysis: v=2.4 cv=X71i7mTe c=1 sm=1 tr=0 ts=6a7601fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NJlDZn8G7RColAB3xCoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070125

The Qualcomm QPIC SPI-NAND controller supports both single (x1) and
quad (x4) transfer modes, however the current driver operates only in
single-bit mode. This series adds support for quad data transfers and
includes a vendor-specific fix required for Macronix SPI-NAND devices.

Signed-off-by: Md Sadre Alam <mdalam@qti.qualcomm.com>
---
Changes in v2:
- Removed incorrect if check 
- Updated snandc->qspi->cmd with quad command for further read in quad
  mode.
- Link to v1: https://lore.kernel.org/r/20260716-quad-v1-0-636f74da17e1@qti.qualcomm.com

---
Md Sadre Alam (3):
      spi: spi-qpic-snand: move command mapping helper
      spi: spi-qpic-snand: add quad mode support
      spi: spi-qpic-snand: Handle Macronix quad read opcode 0x6b

 drivers/spi/spi-qpic-snand.c | 155 ++++++++++++++++++++++++++++---------------
 1 file changed, 103 insertions(+), 52 deletions(-)
---
base-commit: d56fa0b2bd2d9b2fddc10e8f5bdd42d56676935c
change-id: 20260716-quad-ec2765317214

Best regards,
-- 
Md Sadre Alam <md.alam@oss.qualcomm.com>

