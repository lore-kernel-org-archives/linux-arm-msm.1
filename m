Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542428;
	b=2B8AquaQg8OTDfw+Oayq0LYsA79TfvRLLPw0VysAxQCa6d5QcTagamCLwY6aRZNgfghe
	 do0zDSZM35DkI02BheMOycVmaeLM59Bne0pL6Wy0h5c33ZimSwH43erAXQfViBGr7jAdh
	 e+pqC/HIObod0zfo869CrZGBooDsAa3eNbzCqq89tRh5ijveuxUzXK3VJLpCB5VtFPrfg
	 0vjEKbKMBjFDG/q1E+nUufDQ+C40xsCmQosSOZWDAGPGNrheBWMA55BWfctZBzyCnkfqX
	 SBy4pdJgiNVjmQlkqJvHtW+FO1rpGJrBXljm2IBDm0gH+9i0eZal2v2wMwUZMeb9NHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
	b=E6jMzXaNpe/cIvKGV+hEKzN14aIPAW6SjBDtOvJSEs3eJFSNjxBs67okdxyvKcT6x8Zb
	 44KNzI6qOYci0aS67Y/BY4MGCRvb5VVzwJhhvWFo3TL2Bt9oWWVeijIviJFXEF8zG314x
	 I6QUfseFc7XSmgmPKWAPaiyj0VdZCQYfUlLuPzRPvaLlgI75I1TOoxxXd3qfZqkbk0RHd
	 TdE23pEsjwNYTqU+jtUiorwpOeqyL5AM2Q21CzWNwr92SXt5/XyFWHFCoMJe2t6awZoPY
	 PW/mxzxA1//gxR5cld0mmDsQJvn1WshB44INpWB9AACbFY3kEJgRT2vNYnHNJjEZ+QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UINICc8M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6eVoHYK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9EB606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9EB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UINICc8M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6eVoHYK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLFH22318362
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=; b=UINICc8MB9+vIMQd
	lVKCF/c3qjM6TUI0tUcjZM2g+4tG4ePuaCffiUwd2w5fTukvnHCVWRY1XFRbl5Lw
	vYZvYxZYiXt7dlqRm2e6CdYi2wIHufYdsw08oArIU30+hnKspDTxaizR5RlmX/CA
	cIw3yVhJ9rOCesYjPj+GaIzSlVx0UVyMB4Mp/bIWXkRDxzvUV4Quds+oGHBEGNt2
	uIeWHm6EJPRH2oBdp+dE4HCoR9YUx8naV/ckVSBSoEB0a1h395ek5MdKUlMCf5KM
	D9KLSXGDCl/E9ckaKNttzCuMk2gNTbVn4/f2cqzTnH5hYTY2aJDIN2uNETKH8+1M
	Ag5E0g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd47c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:47:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee4ca144bcso697879e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542426; x=1796147226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
        b=X6eVoHYKuV87L/VEe/nc6LMahe7Lp7iJyvY0RPGFOxygAHNL46+/SEt34YtRGWbXMz
         Lbx/Gpf8UEc9PIjg6LAuSmXEZSu/MkCgE9woGjiEBIxYcfrLlnMZ8ZwEhi5pRBIJCWZI
         XqsrXKiOneu9cOBy/v1xj/o5nFCPetJvsaMOPVko+BxrxpRGq4dnPymNkfDshYKJDS/3
         VjczXaGQ4r82NEnzIaPjUsqhJCiTWhrZHZnCnIBv0fReXYc1xxvrkRycWjyahnboPZQy
         seELReES/qriOdH3zTw+MKYe3GapfNKzrP5bGy1d+bIehTEYRd1wAE3kKw4VSyEi0clb
         BBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542426; x=1796147226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
        b=BDRWB42o+soGwdS3Q9RWBsKHxSGVXG4d4rURi7REO4egD9b4UJc3gkjQFmmdBXFW5n
         MsaK3fR8A/n4hQx+zKRTls142iPqhSjHxJrJWzkA7fuyLn4L/fwEUE6Y/9n9WmgG4ypW
         g9TjHcjTGKISf9FYdEDNwqJeaag3cQ2H6i6dWz1IYX3FE+zOYL0C11ITprZ1NOv5SlM9
         0wPBdsbv3CyNynBoZ2OKgPh9h39Wx2+W53r2Q5b7nI1X97v6IUb2B2FtWqRA/v4EbXGi
         T70cbZaUcC8P5C3rpxPH2+jdYpiNvGD4kuHR4+Fb9D8C9ardiLHmMTG6sWF7oYaQvcbR
         p2DQ==
X-Gm-Message-State: APuU4Z9zu0Bwmw7gTgd1fkWXFhB3zlI7mDKiwVqQoz2nnWM4cSIFPEx4
	uv2LNE7z1D3hwUfaYWkKsX6f3sv6yrBKRjoPG9d1c9bRBeeVkePhpb+qrNFFCB+tuXLdtlRXrvi
	CD23hvp4WYn0L369MDmsRV9Q/c8EA0iPiPk7r2WVI+/oCEbjcZ85mSIonAubWEc2TH1Ua
X-Gm-Gg: AZFdTZcZZTxAs5TUGURfmNkL/Aji8J5y11w4i9njbgZNHz6RvfK0J6fWpvKsC6HW82f
	1LoxSDYg4oTo1iF95FKkorJa7HdPZ9r1yA9+yjRqg1ijkVyUof7/vTxmBHm2EqF2mPGSLQ+MGb8
	4sOe5WaaCUovi74ppDTLpooGeV6q5f7vHzXK4mf4nx6IWLxFmrGIoMyF/4vXOfGi9uukNDhxD1s
	4qpsjZtJDOHsgk1VeHz0m05RN3w5SrDwQuh5ckO9fVIpdCJT0hH1xBpABktHXVV6y/DhFsHXPl8
	pytA/YZ7gbyEHb0f9kjNJk4fz0z+aiyuwoPWiP++kX1xUWu3RehZcY16s+zg8jreuFXnGbNuA5E
	zt+It6FAAIWFwxgj1nXgWldqfXY4xfE9zX8U35+DiuYTyGldyBcmcwaINf5wpdIYZh+WjRqThkv
	hIuzjPCSUQRGfC
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ee8af79c4emr7196735e0c.23.1795542425872;
        Tue, 24 Nov 2026 09:47:05 -0800 (PST)
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ee8af79c4emr7196706e0c.23.1795542425373;
        Tue, 24 Nov 2026 09:47:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm7396418a12.20.2026.11.24.09.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:47:04 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:46:50 +0100
Subject: [PATCH v3 1/2] usb: misc: qcom_eud: clear the enabled state on
 disable
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
Message-Id: <20261124-qcm2290-eud-v3-1-4f31aef8c1c3@oss.qualcomm.com>
References: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05cd9a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfXwakRYNVHmdnx
 /pves2GDmTwI1vCuDeWzpHnriKK9HBWRJfmdLjzxWQ26gvs1srzn/+OaLx/qM/KlTStb4tu8fMT
 gdOsX744y9zoPrjy4XM6SUY9dpNHQ/DJbeif/rENC47kYfK0icyXZ0c+ZxoUnoFacwygYZPl69z
 eaET6lxLzejwG9J+Nx1WwXEQtdTkbrR2gAKp7YdjZeY1D896cHftEQZfiMXexFaXDTW3C/2Kadb
 y/rCJUXNbvbtkp63ONdginq2tvjBQdnd82RqWaGfDCEAtSRakvPXJzrpiuCSTDc3Om4sf+/f08w
 4Z2aCf2Qedt0+pnoi0CII7FRk69oEC0jC9douPkpwDT/62mY/WHlMIAp/ivLivT0rmjGYAN4ArQ
 wrueVJ9WUNEway3QS8A4YofWZIbcXg6cW7Knh9T0LLFuOdFs+7CWdEY+l1BEK4hljDWJO8hP8YL
 D4tzxQxyZMHO1yka4Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX0RR13kn9kXUn
 JfqUwKJoiL5T4ysidCM11gaGuZXDCmcYKo/BrOZa1JHbfiK4/7FXE3fJwDAZMs7sq44ZcjOeLFC
 eYv3h8FRatHoqdAha7geEMpK2bivOdc=
X-Proofpoint-ORIG-GUID: HlQ9IRa6nIerbVoDedHQQs6qPiYgl-gA
X-Proofpoint-GUID: HlQ9IRa6nIerbVoDedHQQs6qPiYgl-gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..6743a1c7d717 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -97,6 +97,8 @@ static ssize_t enable_store(struct device *dev,
 
 	} else {
 		ret = disable_eud(chip);
+		if (!ret)
+			chip->enabled = false;
 	}
 
 	return ret < 0 ? ret : count;

-- 
2.53.0

