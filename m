Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452188;
	b=CBHnOoxJDIDGjOgetXvr4sespqaSV5l/tCl09XsuyPTEZgo39wnyVPIZDXehudxQ7XKd
	 eiEDUJjoSjscMb5hu9hXlJFPo39WE/H289VRDA05/CE5dH8ZSghmFG3VeRT0HWpWFr0n+
	 pzTfpfr7ls4Hx/L7OV8wov1xS+115amWxcAYMvXFDG3JTcD9xjkbaUaLNNDq05xSuH9+Z
	 66wJdtVdup7/DBFaCUD7QrLrcY8v2ZYcHTZPJp1ZVgIp9s7yDJaOs9G6lVipzghAqniD7
	 ZpidsZmNRGVXtSgvdp5CxI36m+n6DNzs65plvHXwnYp62yzd3ZBwbXSYnvrFg/lxX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
	b=4voZSqIM5fBDaeQXRIEfo+dRnDMSDzoLRbYaW86I7uMnHmBTLt6dl8gtIOtEn5Ndzmus
	 fhW6dPkCeuSd9JVqbuh0lbdYDjtFQAOL2PJPOqGjglrlZfJCmXwk3dJoSWNfNG5LNIEDi
	 SdSOPNU7J3QeBQOzq8pnLwPFJ9RviuYfGxzdBszH0QpV85/C7zYZwH2srVUCx63q5gooj
	 PkUd1CLlFbQrIvNEEkX43zwIScNOyhK+2gW2a1Knu7/mlz6FCL9v0smA9bpMDGGeiNYwD
	 U3MKHpLQG+60QnjBpUyhjZMomb7Rpm2WV7RXJ0FQ1LQwThaNO57zGjTOSwngVGF4wTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jVaG/tJP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DXG/Q+Nu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D2606A339
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8D2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVaG/tJP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXG/Q+Nu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH48v3730755
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=; b=jVaG/tJPi0r5azqr
	iTYujdKSSFZiF0oXoaHGBKaO6GK2EeqBYYH/R2kMDVLZJhFMvnvC3N/l8UjI0KM4
	lx/0zs4BV6JRBDoWACHFkH/UWq/hTNj4fdCCTrHDOIO+Wd54RPFyg61POHHB3P8O
	P9KM2OyBzCWox2oAa6WxHIcVQJf5Qktgie1qgFlAfl0JvOcPn7dQyfkIzsE5KO4G
	Df7UWLuBZk4LdwSGEUYEctt/DZksROF+bfAYjbhNygHjCaItPhji+MDZzwUc1E8w
	Gl07qsYMsDkSxvlJQ3RhVbG4Y2JggiZoGDnrGbBNJgyF7b3uHLhMebIS7XkI95XU
	1q8lyw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2eer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso522577241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452186; x=1796056986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=DXG/Q+NuMFr7Yuf3I6NXdU4VD17Nww2DhT9CBq+IlA59etn7L9LJ4qSbLU5gb4kX7P
         GfD1tMl87Gjd25P02rwETrqP0+4lzVp+OaUl8qGB+Sh/z0FtBn7d8aG3FtVMFHwW28p0
         ztamE50DOdvSyQLNm+r18CNW1X/bgAT+vJDA8O9PFxCfcAZy60NfpSA9jucMYfQ4mgVm
         r42/QUuXAUfT/rFvFHhm18Xw0qkVNehETSlC8AgfxUE3qULF7rPyDRp1HLIL+3QXC7Dz
         vp1lNqb3+QCEcKFjFxI1ROkQLJsBBBg4MG+4nHa8BOMppZ2pxuLrZL+wADSQbjNqbfmD
         3CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452186; x=1796056986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=eNZWTsoNFUCSlXrH9ljochcIGdzYUY9LqkrJf18EGzu4Y7wyeE4PUzSyJBFqPfovCz
         a0uZqjaI8Or7vR57iTVmKezJO8vMKMVjbZ9N4dQpPZaFFXhWzRkVo4C2OeHdZddnFw8n
         br6iZoKLIRGLqV98MzR81riDj+2poK2dcHnQ8+Zs+nALM/icpVRfaCb5qd2v/kiMNPKs
         +qh/PWeWKtcgD5y7BP1Q4PugP3BE7uCTLSRMVppY4WWU00fxp4cKoBxxYqiCR/+461TM
         2svl9cX5uu+SqrMnfJc6NB/62oc8m1cuhld8Gze3uMsm9gQdAUIlDakOr29oL5jPp9L/
         0BhQ==
X-Gm-Message-State: APuU4Z9fbMwCh4vjkCWkYy2BjqSKeza9w9bsrPhk4t/CkY8qe/NVGISp
	WAxMZwGNznvfgkXZergWqN5ox0llqRMmf9hAU5hZDT+SPj8/k8zPLI9fd6akVIbuWunQPRkuICP
	9HyD7m4Lk9aF3v1V6Kyd0kJlCf5R6sTKVmbgJtYSR0hdguWFTDSLkLmZ5CPKbtl7GnPsQ
X-Gm-Gg: AZFdTZdJ6FxNYY2sEk7mrlNojpvK8EaKyCpceGus0a2CqAU5UGdgReUsUWZ1lfjJ5U0
	Kt4YZWqmHlgrcMpo3mL8OnwdtYmjwN0L6GTIhNrg4LW3VoBRXuYX/eljRaMap8K82fkPuC8LQ4i
	A8BS6nONvmQTFinm/UPrjM/t0pOJQ7493RUuRdPNsU09uY3ZZ8nXGr/gqpm5VLuUqfQKbC/Dvao
	ffQEKGdxoe7mJcdo4992wj3iJNxyVpp8wNNtwTHgjQvz13nkkxX9zwKIoD3dfz3TJFbbbN063Nz
	83kjTabr6kFdH0aaFEkfRDwvWfYSjN0hicskE7otKthRx3+SXjitNg01JCgnvaieUZaLQSyOMVv
	FEyK1RaAjNjT4n7ovgi6eA7slrLi2kE6VhkTaxcMhGArG7tSmYtbQgsdSFxTa0f/+zbbRWEYiI7
	ZFEON5Ytgwjlny
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452465e0c.13.1795452186328;
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452457e0c.13.1795452185869;
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:56 +0100
Subject: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
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
Message-Id: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 2nPuK3gRcu6XpDqe2uWvaKnHEJOiv_DO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXzMj4ubTDn7wR
 fw9TNc5L0Wh5wRr9ZngYSFLWyZwHKFjjAwyi/8E2Rfud3GLoa04hhrgU0Tn6FN3uycVZm3PpziP
 lrabe0ppzqB9acTUgIEGeU+iZKdw2dHivIqVBXuwC21Fo58jKXe18lih6IXMdFqS3ZXMyISHfhv
 NeHKMKg8vuPeBpkkQ4dSnBAa4mMMtKrFb1OuX7UefcbJVZmXcao4DGob6tNXWkdA/Rauhpg+lYB
 4jIGD2Y1M13qaEM3pslXkvLXeh1yPIclzyrQrtqON3xxMITB1FA6o1Lby4B73AgEDHPN10NmwV9
 28zYeZj+cYQmi62bI3cRAwHmQK5h4gayepFUfzsMqqjS1pAbbwhc/9GhndbtyloXjVmyteM3xaq
 0ivrKZCPXCgR0bHJpYHc8vqrJMZ4m8VNQhE2mT9TiIm98vBPBVWONhrmGlNLRYY2C51ejP5UgU9
 OqFJfon8D7Q8zYKTkJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX57TxlbHcQL4V
 Obl7qDhDxnUyzpB3624YwuTjUcNDfVUiT0zhwoQ6oJFBjhsbkAYt5K/1EnYuMbEMtytEPAMbVNR
 wWKEkpLHWgQl2CZw2p+FEhsNEcv4vYQ=
X-Proofpoint-GUID: 2nPuK3gRcu6XpDqe2uWvaKnHEJOiv_DO
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046d1b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
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

