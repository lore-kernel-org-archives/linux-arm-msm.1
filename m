Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873196;
	b=ed8tkkl1BCNp4XKY2cIzuwoYDTbgo5HkGDF1aOovhd73HNskOqcMPZWxfl96tmKK+FVf
	 FY+tq24z05ux+qAoUPZZpPB/pxKEhHKBbP5gpboDqGpIr4UXUF/xK0Jy1M4cI1Zpb+qRa
	 vZFm+yjyCbVmDrBBgWmAwBQL61ZZsCjqT+/VwUftGmZ5B0IvkARVVc6dm+QZNUtpejYFh
	 5cF/4zdLu0ZPkU27XobCH44fE8ai6p0D6jJTHusknYKOy8yKOGK4VjE5TcCZqleXl1U3V
	 DPs+5nqtMg4SWVO0AaXMnvYujigMaIcSrEulwhrAOYGbbNKJPQbsyUoELTDBBtcJUoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
	b=0k7Cw3szgMf4diCZanQToLWNExOkctpDch5Nv30w3nTfyP4f1s1J/uvGlAU2V/eussGT
	 YV90pFpfwIMyUb6I6/7ANQvVsFUiN0mdch7bJsgngjfq0BBO+/b9kMWrmHoJBu/Ield19
	 FqwLnLidtPn4HjqRNoYk5lD/cWajyEfeR+HVXZx1HtFS5mYfCxuWY17zRIk3UourOtIxu
	 dKPNrnrjj+1CDVAdWvMWbI78wcs7OkL3+eCh6jgqL4frAyZxgJ26mP62lLoOlhOegPnRZ
	 BUKUVN9309qJkI79lKGHleu7SSrflgTXPWFC1Nr2IWUXD0FX0MMfYTYYupSk7NTYn8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq66cKjq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbaXrJ6c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2A9606A333
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2A9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq66cKjq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbaXrJ6c
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tBK63684325
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jL
	WaZZ+9X8=; b=Iq66cKjq3yYEL2naEJff+GMjZSETIrIg23pQAjdYO/3LsBr8bYF
	NhazVIm6DbcCo5gB/FfecqRkVv9jEh1p5eqdNgqQTFUzMVl7f+qmMlgKLo2EThvp
	b3Zl52OhFTLdzjJ0O1nQbhoMcxFTKj8sKFWAN6boKLCk+bOs+MJVzDPi5YCroei5
	ggkts9pF+czDWjNejC5NJ15rZVwJfYFcDlY+dkU4UOi8HX8eNSx5+3mqw+v1tdDs
	8TUTD3P8s3EPl0u4LevtkT3knVx4jjy2m7BVJrkJM8U+hkkz1NXEXLVIRMzbn6BQ
	kLa1eRu4SNzsYjX4+DG3xYWPULMclroK9uA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hg01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:06:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36c9e87d262so2302274eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873194; x=1794477994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
        b=gbaXrJ6co3KCPSM90yN96D5bQmIHQlBjL9NBo6bEQ7YWAAZUYagLoOX6Zwdzr4+KwN
         urLEMXFLzrJpuwaCFfYBcVlEBh/S5guGuEM399BoENvWcbFInRFXvEHWo5ABHUB+nykc
         wblvGTIsEgJxcUnMvyS/Jz/Gjo8J+JK7jFa0LHEqxflzkZGqDo09Psc+NycbgyPIbxFW
         sSQnY+JeTJgkE6C9qPEhaeIVf2r5zYY/n/qah2DheDzNRGD2DO20rYt6E8uBlLgPapyb
         KWzioSn5Mt3zieZeY2pHeMEwY1QXsX1tB2H3dL7IsOug87sf9a9grfbse3tIf4blXQxP
         oy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873194; x=1794477994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU/vOX42w3GP81gwU32haFOM+yeJBosY6jLWaZZ+9X8=;
        b=qy6PaAJcTGXKOOLnHqsy51kIcTMcCdx8Jv3u3b+Sh0aVmEulKj5xI7m9c2Qi4iHvnd
         93pgdWzY+Tr07z2Bdb7QHZvqRfcwgxENNQw8LEI5u04gJvi/TvoNIbhQi8HlRdNFkxRw
         hdGineQKd9ZxE3cPSY1fY8klHdzk3Jm0pr2E27vnwWLVQUUArJNu6uMi4YAlGX6mtlbG
         hi9kcfl2VaLQgjrs4EJoxqFwdAnklcW3XcSiI/8dRfTvaChwVxzfrWQf1VNcIO6SdhcP
         ghzKDczE1K20s/JgyhDEpmSVBgZx04mUSufEIoiDktMYJN6JtOo6905AK0AE2sdvekFD
         Tm/A==
X-Forwarded-Encrypted: i=1; AKwUvByQvwKc8Zzfv0/4WyjF1LwrqfLoZJqfaJMM7TZhV+6GUgKyEx/8wQr1tEG1YY3PlGNWBdsvxdBRJXQay2+B@vger.kernel.org
X-Gm-Message-State: APuU4Z+WQDVxSqfSxlkoTzFv3nRAT4fA1jzL9Yw4AEY3kNHETZw0lxpm
	pUbz0X1wfFDcuXWj3cUVhKJ/+7u6bN6Kph3sB+/mLhYb9jVLopYnD7GYpml/LFtx3/FM33H2aaX
	PzKaAwn1TdyCA8/zpErNOVnQmT0UiVWjCMVRgpyfIKjYXgShFLBUsoecdw0cvDz042/539myQ/0
	XK
X-Gm-Gg: AYBFou3UlM4Uv8mK5NjAk6y+hozA6YbfIkykG/a9WCR7thortdz0HR2CwbsTA65Jjht
	/GPNnC+MfvltX9tif4Ty6O1rP59Vjvgy9dtIERh3wP5aWwjwa2Fki0t9v9UTtYflUeBqan6D8oa
	e/U2AINDPt2rJsfb1wOKBWctYLHHaiW7niIuG1kn0DHWPwh0p7rt0hM0sG3WDgCFW8S64WqDvym
	4PaP5H2trR+FFgxGhdZr/7kxwMqPJod+gE0/5RQWvc8+wvquj96ZtuHiuHeXf+0kve9d+K6TChD
	iluJYBIaMg/BbSX44hX1u0o4kAgsz6NntYHJIftoadEOadnQ4HQ+SwDQldFLz38wOYpDU4bbmoh
	Y/+MpXO5VnIQuCi8z8EwuQ0lYdP2CypHMoW62/P5h78F8bwSMwsSPeZHYn0NNVIpOmwA7tcDCE0
	7x
X-Received: by 2002:a05:701b:42d1:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1ac5cb1aed7mr29126440c88.10.1793873193919;
        Thu, 05 Nov 2026 02:06:33 -0800 (PST)
X-Received: by 2002:a05:701b:42d1:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1ac5cb1aed7mr29126382c88.10.1793873193120;
        Thu, 05 Nov 2026 02:06:33 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18719239c88.15.2026.11.05.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:06:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Date: Thu,  5 Nov 2026 15:32:16 +0530
Message-ID: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wcJyj1GmWZ0uGgoVTZhRuvCihH7DuBPP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX6va7/HCb7ISH
 2X3SxW8sip7V/LAveAYV5eUbNOOTdYXoiSFO5ICK5asXPnAG/+JagLn08RhLSwe/+bkB6ZLzSeT
 FXD/41amCeenMADMJNmk1Ah6boIwHaYYKAsix9BjK5zIQXHcPwK95SVV04/OIBtOmxD3KBryXRp
 yWZ8E9beqewoheg6b8N+ZOEPydFQP2XMjJefcfCJYNtNuN5GwuEsDYNzsj2fMn6F6N4dfTXaNDy
 ESRfyB9chjTHEpwCv+Qr2dVHMjqY7asNq2HeeM4wlF8Z0XQAWVjel7otqPxpUDpDUz/0ifWYCM7
 qi3TQlLFEI2arinVkjQbUzrbuZvrjQpucz9Imi8u1/g9zbG0d9tK9a8kAkupZCPAO7vSDOVTiJ7
 Wrd1gcP6CWah8DnKc+gF3T9VfnIx2Fz+wqMyTKkMlqYhl0OfxKGEphtZLGH4/69bh7mqOkrLAYe
 n6/wqo8tiuMliYXauEQ==
X-Proofpoint-GUID: wcJyj1GmWZ0uGgoVTZhRuvCihH7DuBPP
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec552a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pXwHkFXhuZ6WPUJZpREA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX6o+zdBgazdac
 F1ZDybWdCHYF6W9SO7xLzI3KHCpxf3AIZTy4hIyi65KedApZnKt2f+QhvLg953H71sGSTBUXCSg
 4QscGVIcFWNImhDdVKCLl7yEjLpkDug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050040

Increase the nominal max USB memory bandwidth vote to let DDR scale
higher within its nominal corner, fixing glitches seen during
simultaneous USB audio use cases.

USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
MB/s, ~1.8x). This ICC vote does not by itself determine DDR
frequency; the vote-to-frequency mapping is platform-specific and
comes from each target's interconnect/OPP table. On the tested
targets, the old vote kept DDR pinned at 1 GHz within the nominal
corner, even though DDR can run at 1.5 GHz (+50%) within the same
corner. At 1 GHz, glitches were observed during multiple concurrent
USB audio use cases.

Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
With the updated vote, DDR is allowed to run at the higher nominal
frequency, and the following were measured (not merely projected):

- USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
- RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)

RTD-USBC is the round-trip audio latency measured over a USB-C audio
path; lower is better. Note the +50% DDR frequency headroom does not
map linearly to the +16% throughput gain, since throughput is also
bounded by other factors along the USB/DDR path; the frequency
increase is necessary but not sufficient to explain the full gain on
its own.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
v2: Added Details of targets Tested.
    Added details for usb vote.
    Added KPI Details.
    Dropped USB AVG BW vote change which is not needed.

Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..3a19385969dc 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -46,7 +46,7 @@
 #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
 #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
 #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
-#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
+#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
 #define APPS_USB_AVG_BW 0
 #define APPS_USB_PEAK_BW MBps_to_icc(40)
 
-- 
2.43.0

