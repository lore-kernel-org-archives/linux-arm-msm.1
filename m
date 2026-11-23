Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433773;
	b=XM6kj35G+CwYLdw4IbzqpoyRWvPD/eYAJTpAr8Qkf3ZY0WkNvoIBpmJr5chX6td+jnoG
	 aSm7rpxwFk6IyRR78SHmqWy/34OBc37mHED1o63lLs3e4QnILxxwRyFdqEv2uzu1uFrJ8
	 BIOVwac2Gro0xZAXItSfsiVyGiYcMqy8Lb7s0UBQrR5lZxNQPK8qDDAZ+agXozvoC/glE
	 8bFUwmjCcsCqqh0aOkTQMd7W/cRPTV8qxrWZ84u6Fua2GKv+WMOYOSGqmUmIPognu79iZ
	 m8RufcTSuN26WX88uviiwIS7xaW9exUMCDvjSczK+CBfbohjCdHfp1RMW36iT/17d+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
	b=oI/LlxUfyq1Hjso7JGNlr22Ri8O6rxzAQ1JGIdADpUKdbZhTOt3EZMH25qcW87vFWO2j
	 JFIrE2aenqZFKJ4XZfjeWzJG3K7QWCFYW6pI1s10WQb6Z9QOSC7IBFSrfs48exaUBEC/y
	 oxuyF4ypCPzIQn59siASsptlIdBym4U3yy9yLRgOs5GHJGnK7ffCrvPOeoZxhudGRAp6L
	 SyjchSvU9Lat0jD3vnhw1OJm/ZkDqQLAuE25rsmmu+AejeUCoNBlJosLJnyZjZKX9BqdI
	 du2tNG8JQXZQ7GfpRwncearvwqxg3YlQ+14PTgmYOahj3Uo+rcO0kUVpIUR6TXyi3RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2cTu1ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHvyILew;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B61606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B61606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2cTu1ho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHvyILew
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7a34095727
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kvf1DqFBV/lYSc3QlXJzJu
	Xexwpm5K3ANgpze4xoM4c=; b=f2cTu1hoW8g4gc2nA2KmEj7+fu4Rcv6msPJOZj
	pWfS3GBSDt57U4QgesVu2y+y7tr/1vpP9mlzE5dMRgcDztNroAjd2TSs8gOmA3Lm
	05x5pXTTtAgW6A6fxy/dWrhJSOIUmYjq4N4N0X/NcUhzA1Hk48vbNEhPAuX8hOz2
	aBwZaWoVmfGX1+xkQrb5bXKDBqkjOYKzfcMkDochqvhM8g7JEif3WbyzyzAdp5ei
	L8r4dxJFAv6U1K6P3QhxtCOshymmjgt51clBV46KQtDgvbrBid8n6m1lwt6YDS8s
	ibAiJHeOOkGhQK0ORFSAnUcZoSLBgIA7QuOBIwTgUpxEYa5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g74162k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:36:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2414493a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433770; x=1796038570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
        b=WHvyILewrcips1cDH7vbJ3lUf7LorMQ1n/k7wtjsBgOEa2SgQzFszKGCHZX38OoGQj
         POEKLJC9zfXQLXkuMG0B4X2NflTWFT8NTNjbdt26KXTafzG760Cwyx6zOv0MgJDgQ9/8
         5MD8iRbc04aiE/bj2U7suNuA1ooXIdnVoBwIpWO/hsDaaBq5fRlGOus1VdrG7cRhYz3e
         HxPSgEjMYP/IJhQbJmzdVrAuAXzbMYg8RtOd1wMYqi992ECyT9nG8RfPdykTyJkhuaP1
         7jhEJ2XSThDthPjW8KqWTE/2yDorwJ31rzXeDzDFdZ5fXSb9naC91oC7UxWzlhbtK0S7
         +5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433770; x=1796038570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kvf1DqFBV/lYSc3QlXJzJuXexwpm5K3ANgpze4xoM4c=;
        b=jaN8bxRrTm15frqZKq4B6sEg/lURiHwqWkSkoaifNdeOi7aFafYfG5EKzQPDyDngO5
         KfJOQDkngs/FK/c2fkOllBt7rvhqSW69C5BR7v2b+dnDX8bRbO4HaiEkC2AijTTsEUuq
         wc7jqslikmhHRzto+E6dGB9oiaeCjp4tHARtWg7sdH5ze/1ucI6oDZRmeHOJ6UdD5XwZ
         hhqAnxsoMG/bbdPzNIfyO6x8MEV8bhcbAr90evaHvipLrk1Uh5EfLrpFBP8o1CbpQWR+
         UbjfQAGUcKuDzpYmRPX6HlJJTkYKKHFAJjozxZhCugXNYvjkCaN9exA5Ud7srZ5luqmZ
         2hCA==
X-Gm-Message-State: APuU4Z/Ijy7C4bUrwq3n+rS66RUeE6vyWASVQDVjS35PxdV+JR4b8DP0
	YMZXBQdMDVS8kzbwySinMVyf6bzl3I39RWqnyJ1RsyeN8ApSivbtC3LowZ5vuvb6efeXwqoGDzt
	FUwRTLS6V70dJ3VwItsiBI2fbYsfZTF/8/ibO/UHvh/5EHSY5jlrOKJqnZLIZLPe5OuBN
X-Gm-Gg: AZFdTZdYqe2rFDzUulZI78uLDhyGHKsnU5g4YzOcM0DLYnxZstN0ijSlXhCmy8sRMzB
	m7RufiGX4mvlyYwqJWlCbbZhlEwTVC1Tz7y0e8cRkDdPM282oON6UrLhJLrpmvKl6nZ35hh7W14
	qO9xLDZ7iqDTytEEzNrDnx4AwDeJPw57plz6/OoMPjEFfFLqLItdeUZoJV8m/WxY6ADSqE7Y3/c
	ejwE9Fzj6Z38tiWXA1zLo0fdKnNKAl/IBvrQ54HpT3WxhJL6S9B7YrxcbPjBaoRPsd03iuhiZoQ
	fcu5daFwR29I2yqEaFZZ/MiKOhf0woH4o70S6pwuqgnn+IVsYn0mJFVqEXBpc8x1fr8htORrHch
	YlAI4H7c41lS36Vf7231+kuYxTLMs9Hy9vSw8pyFnTQfFyo9JS69w8w7pvK3ZUJqO7jbSzsziSD
	xMRZ6D
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr10129787a91.25.1795433770189;
        Mon, 23 Nov 2026 03:36:10 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b41c92ce58mr10129770a91.25.1795433769726;
        Mon, 23 Nov 2026 03:36:09 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:09 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Mon, 23 Nov 2026 17:05:58 +0530
Message-Id: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB4lBGsC/3XOTWrDMBAF4KsYraug0W+UVe9RSpGmo0QQx41km
 4bgu1dxNiGkm4E3MN+8K6tUMlW2666s0JxrHk4t6LeO4SGc9sTzd8tMCmkBhOT746WfyheGvlY
 OmLYq6aC1S6yd/BRK+XflPj7vudB5aup4X7IYKnEc+j6Pu84LT8kFH5RIAZQn68kYQ8oKa7ciG
 cTgnLTsZh1yHYdyWZvOsGKvS83ABU8YLfiEToF/H2rdnKdwvP3dtLF6s3wwQD0ZshkRorNGeHR
 a/2OoR8M/GaoZDkL01qIGfNVjWZY/9npnJIMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=1935;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=8yFIvWAABarJ0JyJs13EEogwta+ICFjTnQS8FxrfjGY=;
 b=0whS6kx5agoifZd4Hi3g5c1l2aKyklENAVvviS1Ua/4nBS+idtPpWP+TpLYe7U5bN9PeDuASC
 pzfCoAjkGS0DB8GqvdYjBCbJy38VfUNfDGEQUDk9YkXnErqt2ZZq2D+
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: sl7RnfIRbWbpCIrFtHEhhZUSLw5Wqn_W
X-Proofpoint-ORIG-GUID: sl7RnfIRbWbpCIrFtHEhhZUSLw5Wqn_W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfXxEMOyi7G0GXw
 lUnXoRRXJjiMa0DLT6amNUsJw0RdMynzDXS7E9Mbf+I7Hab5tmVDvNENvfVmT4+DvE0MsuIQ9pk
 mfSTxauEByd+3SQXTfMaAaWSfg0UOJY=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04252b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfXzzFmUMg7CbsN
 Ot0wlxaFWIOprEp5imapiRaCQS9UpgvGvey8SRmGIqjZ9ufajIbHcSPZryaH5I7VGuwTMM6ObfN
 4L4CGAAZZvd1pc7iEMoUe9JuTGqHWO89kYNvyIPK+cr2bHH+BXMDMy0q9SV9a2vxMc8uvaFb5W5
 49RhKwnyy4SUW5pi5JCne5E6Sjyv//xwAhCHmSCX5SXv8t2KA8eCuNrSZbFMh6IsvF/9gzphqXh
 RatB9KCvBDJLphIFMf6GTHRvOqbtA1tpyfMrAGA6vnAClo8+C+mFTjUAQ7WKXDnmKVhKOqCZPkT
 LSMKaPHv2HjgRRNMipLvEDTvGOFgXX2rVpRrQ18Wp1Gd7CU1UyXRiZj6+UGVhx/s3PE5EhnvJMi
 AJlGSkZmqOhIykCgGdVnPkbcNfVHNZM+huKkdoByXAZp9pjIsFQRdxjHHPvPufCc+KRsEsVgV6X
 0tBMDGAfil/JBo3Zvng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

This fixes the Glymur CAMSS binding added for v7.4-rc before the old
port@3 ABI appears in a final release.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v4:
- Rebase on next-20261120
- Add Fixes tags and clarify that this targets the current v7.4-rc cycle - Krzysztof, Bryan
- Rework commit logs to describe the ABI fix and Glymur CSIPHY resources 
- Link to v3: https://lore.kernel.org/r/20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com

Changes in v3:
- Clarify the binding ABI change and why the old port@3 ABI worked - Krzysztof
- Explain in commit dropping port@3 does not affect in-tree users because
  Glymur DTS support is still under review - Loic
- Link to v2: https://lore.kernel.org/r/20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com

Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Use linear CSI ports
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

