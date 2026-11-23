Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414756;
	b=DfGj7E0/+rKNXeSw44kVmL4UTQbMHGp/waRElu/vCxZ7cVdiyQTbaViifn2WMgW1SIM6
	 StAdS+9/QpLWpWZ5jfvq9LfiU8UWG8XIp5GxWA0aZqXT0rJzbe6HhbjYF8HsqRCllt6jZ
	 +Ap+nH6i2Yrqyu2E+duWNJJcs5fKaoA3Fr9laxOhDk7qRGp6o0ecfkYYgi8v8Vh8qTLVw
	 t3i+AZ5ps1zHeLP039CwJY1BgqqBwW35e1M3XN4i/983/ACps2S9/61Ek2yIl0nkY//Q2
	 DrThRj4FsSte4fkePnXhkvZcq9P9eXLdEDhehC9BwhUB/heVJbKeBMqM6ZVw1/2w82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
	b=rDQtro0stcAGpoLPnN6DmhAkPmTLlKCazy6A/tYfTPMziJCiflv54eklDhSEsWGSUe5A
	 GxKBFbr7KV5xfHG5k09M3acNpsooOGH51YjmcZBjoEQUJ67a9nhZAsc3HIi5IH688Vbb7
	 kvrcZE6OX0Vg6oD5Qi/5vs8y+1BLyBP0GEP+FGo+oWvqR8JxOKlNlkopYyaMFHu1S8f9Z
	 1FSl+DGUyT/jztdTvHCzX5BxuMezWa1cCYlHBBq3xfeV7O3EqMkAYTpF4ovYIk8MspL3G
	 2aUx8iTf6mCrY/b0n9ZlP37s+jNEXGNHEOb6VQnKGj7p4vmeRmCTcdYUjqWGMSyDaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkGRs3SR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dux0XlyG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DF606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364DF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkGRs3SR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dux0XlyG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Kig2924185
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aWSbe8A3Zb8UvFWO3X5sIM
	JbcFwfrEzPaXFLpN8D5wI=; b=fkGRs3SRBK4PfreXTSt5m3RM9Gq5/R7epMFyz7
	I1Tcb3LrtQ6bYFDqyjJFq3tNns+ShU0WQeYDjOG23gAVAe4wyfoTesQjvGb8m/9H
	PuamOppxQUl6lpAlDhCI8X/MSDDTy/hcOL+C6utnqqocOvlVIetBxlqJ5IDDwTrY
	GlhxCywiW8A3O4i7zPT6k2hQK9kTjo5G+20apJfgLVnB7vG4emmhxyt3DcVGpLd5
	Te5kbFL4QTCv3QJNwGGwKclghoubmh0DQ4SPrcC6zWxJxbgLAlh3CbYlaCd9jfdR
	CwXimmhrB0x3eYrwlc/eZvm6mq0YvlWFKtk6geubI9RkCe5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg7px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:19:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8bfe396acb4so2048768b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 22:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414753; x=1796019553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
        b=Dux0XlyGIDN+T3jPMDioAl47tJM8wze3bwwmCUzMfh5eKA7ZaVNgPcnws4Bpmxdoen
         yMtFHOTQPXeUKvHy99FkFH4FocfhJMUv7weAJR7NaHnHiHeo/1IhjNONWfTtMTNatikQ
         Ssr4B+Ih0Na9AmyLq1DL05KJ5iTJImpmrBRtDTs5qhdySv+B6mZDuFfkAqM35bmSOdeW
         dGibS36Om0hcoSpKMoJdPJYaW3dhyn9urBaCCSxEPm2K9L0ckQQeTGrqftynrLVK7ZyA
         JWPwRbdoR8JQZIFK4jG9DQaGbMR4dP0oG8gjcg037H9pjYxlgxz6xLN5h9kXvHRjrTHN
         MdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414753; x=1796019553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aWSbe8A3Zb8UvFWO3X5sIMJbcFwfrEzPaXFLpN8D5wI=;
        b=mHhXWS1nbuW0emeVRlgbGu88/G8S5+aEhTfOpjq85BcM02368BM7sJfUIT70c0WpYN
         Zy82jZ+6MHBLg3o/iN617OWP5hVj8pWUGMpiA5t0WBsiGvP15uGtVAKwDTq7lCMecBhQ
         BSKmiqUO4BAVJ8xZVSda9NV+Ux2Nn3S5ouf6ez1hCwsTt2kXuJWE/avsk10kc55xZYT+
         1glwyADRE22NlcpGXoSyn98wzsZfnUKph5mlgHEMoP/CLr7r6nwg/yhoSa0HIXgDmHgA
         CLgcm+0HKae9FjVlHFfXNsMndRmrQVSvQA+Vi0GN9R6qNnOBimE3mGpW2XPmUpweAM0Y
         WZ3Q==
X-Forwarded-Encrypted: i=1; AL+hErGjTDr66HFLr5z5DwmjFyNuPohh8YmC4CIu6/H0I8gsQ2pa16ptqJvMb2z4NZixhEh5aJ+BEjCxyv3I2RpI@vger.kernel.org
X-Gm-Message-State: APuU4Z+rArdxk6Q02ZpCU+gkG5UJmcX41+qp8JpsKwmKQMZWd9lkgIuG
	fqVmSUDgxJNQUvMd/ATa5G+TXlAM1nSHP15VUZqLWmi21kPFHOhuKjstAdEqJ4n43zsIackc3yt
	cICNIS69I1JxNRgO048yGUSdrmZqbkb9fZkkB496fFQJrpxdJQUsewTxxWYIy9GNcz4BF
X-Gm-Gg: AZFdTZfIqbHgO6Yrljpy2UKlCAwo82dX5QFZ7S/exWr3APErQkhDTsW4bQg30tBFoIq
	MquwWGksixcBtHmARDO3AOrzjxsrY8xL3plQxsGEtqJrlxxWokS+SFAE3QAxWwivOg8GM3Rb6aI
	qhZ/T9DihVEpH2oR/9nTp7jXHapb5RQzAXl3f+hK/a1e3wY3Xl+FA3/NiiPi8Oa+lWcV5FE9/76
	Z2WC51mO371ioAylp7md71tSnOf870AL/HVhmVR2z7B+5vRsoJ6kiE3HSOO/VfeY1nqu9uxJ2ao
	/MX/dZ0+tBIDEGrQh174hyZAMa2g/7huOzwnyzBYFf0h0zz2h+5C/r1iREs/R9Q1irjdqoPiDZ3
	pv4to6ym0r8ees5KxMYV7ji2W1phDRujer+cHd13VQ/+XPgJVkKfTwspGWXUkwk+QPRe1gJHN1v
	0+11t/sG/AkA==
X-Received: by 2002:a05:6a00:9283:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8c87bdb534dmr9611193b3a.16.1795414752995;
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
X-Received: by 2002:a05:6a00:9283:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8c87bdb534dmr9611178b3a.16.1795414752504;
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:12 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Mark RPM message RAM as
 no-memory-wc
Date: Mon, 23 Nov 2026 11:48:55 +0530
Message-Id: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANDaA2sC/32NTQ7CIBCFr9LM2mkEGoyuvIfpAsfBkghUUNQ03
 F3sAdy85Ht5PwtkTo4zHLoFEheXXQwN5KYDmky4MrpLY5BbqYUQO0yzR88+pg+GGPBFSHtltLW
 KByWh9ebE1r3XzdPYeHL50eLrRRE/999aESiQ5aAt6TNpTceYc39/mhtF7/smMNZav18S91+5A
 AAA
X-Change-ID: 20261117-rpm-memory-non-wc-c93a6ff3e432
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1853;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=QOvNwqqx4O4iOVdjpSd7/HzP7iVOHcLCpUjNUJzSGAw=;
 b=TfRnkLYYFY0tOEVZHlNqenfl0IClZQqQPXqLGjlYLkIv9UV1M2Wj0dON9sxd1D56ly9xbgAz4
 q8+GvQumUVHCSrezhk+KDg2rYW9vyIIDng0EMd/L7SoUk0qD++sbFOn
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03dae2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shtKTQ4KWRncmOlHZgAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: VRznG_2WE6cwjMwM-A7n1YzCGx5mFPKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfXwDvKWdK5YHkF
 4OIh/xZmHOoJwFPmCmpKNNm9fad/RoayjlFEpUGO4+tGyYzXrZ4sz1L+1J1riHK8HFoAke+CUqP
 Mf5HvXq5xj3q9ZZmOom/N1eWLnV/Bu0LhSnm5WpuVkqIbJsJZWUMX/9Ma/a/8aEoJsdlDzZ4Luk
 vXZK8REJgIXjqjH+LECUMJMctBJFd4AApH6FFniUEkCC4qbRJFbJWteGC9N0tR67YtVJ009m/8W
 OOkUu2Ei8uasgDSirziHDvSGV2vDfc71Ue4fDX2KCr+GBLYKWsiGl3Cr/BJM9t3ujRbl+As/vfw
 c5W0b+Um+j0OL1QpJcXyW0BIE/UsLnrr0lYP9FURjxtpLqsu0ndFLANhO1vtf44hAzH8uCZ3mAj
 LhWulpEC1sFCZdUF85/678qoDt//jN0XrUlKSt3owBek8OKfJU5LNmKEixV4aqTj8OCxx3R0OLl
 j8mX3UZpKbrAYA7+bMQ==
X-Proofpoint-GUID: VRznG_2WE6cwjMwM-A7n1YzCGx5mFPKM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfXzxthEU0L0Avb
 3tldDSbMfAuaqVx2clzxwHkZ4jJ92LvthoIPcgDyhf112ASJ8+bs84Hvh4r9RJU4Lqo/eY4TErA
 nPaCGX//+7eaZi131AuGMFGkR7hpgag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. On SoCs where it is described with the
"mmio-sram" compatible, the SRAM driver maps it as write-combined
(Normal Non-cacheable) memory. This allows speculative reads into the
protected parts, which results in XPU violations when Linux runs at
EL2 (KVM with VHE), where there is no stage-2 translation. When Linux
runs at EL1 under Gunyah, Gunyah maps the region as Device memory at
stage-2, and the stricter stage-2 memory type hides the issue.

Mark the region as no-memory-wc on the SoCs that describe it with
"mmio-sram": Shikra, Agatti and SM6375. The XPU violations were
observed on Shikra.

A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
("arm64: tegra: Mark BPMP channels as no-memory-wc"):
https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Explain in the Shikra commit text why the issue is seen at EL2 and
  not under Gunyah (Mukesh)
- Add the same fix for Agatti and SM6375 (Mukesh)
- Link to v1: https://lore.kernel.org/r/20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com

---
Vishnu Santhosh (3):
      arm64: dts: qcom: shikra: Mark RPM message RAM as no-memory-wc
      arm64: dts: qcom: agatti: Mark RPM message RAM as no-memory-wc
      arm64: dts: qcom: sm6375: Mark RPM message RAM as no-memory-wc

 arch/arm64/boot/dts/qcom/agatti.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +++
 3 files changed, 8 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

