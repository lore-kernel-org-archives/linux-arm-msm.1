Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372960;
	b=Kf3omUSGdYDxGkU3pX2qr/Zv7cwKf8NIL7s9YPRNl7V7RZhyJqzA+52uXtenDupwWJtG
	 o8KNYCTN5P8kO/ypdvDPrtzgXRUjrGgZea94ywm96M4E58iXARl+64zMqXdhq/PYmm6Br
	 rRRz36GDsU45zlyfaM4gyaK/Y7fcPouPZ40tfcHy1FepX3y5x5Qj3vcQU+xl3s7/FbEf3
	 pnFUwqUQ2ag04BJbAdagtg/iufjSPqACN0uFt1FqDNW7rWIKi5nIuMEcwLZOclWDZ+ix9
	 pFPV18yMasYEr+kdL8o5To+PeQyZbOlI27O22zKb+V1cTc/Yzl18og138SC6sMl1Dbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
	b=oRxYmlCeezka3wG1+15yeazIe/BGTz1Iiz5hjqR36E0HSctE+P26xKx2moOBQKRkKWG3
	 GJSjS9wm4Gyg+OUnWiON5gPwfJjtdomiPzQDf0tNggxyNwEWSD6KBx8aFvwMNEarNSFFv
	 MvJODQ4IsB2rghz8VCcYsbLm7dZahE0FpiUc4KbyaRqOs/tFUvIQMy0DV6NK7549UnQ6n
	 CL1AM6fZ0vdGeoVnJmR/ghdWmzIzCVFvRCJkNDgE9fjUp5nBEhehIdoqXayVLSjd5MEwf
	 5xJl2AXsmOVCC1Ibfnnfs7aCta2Yhg7eH5JWH1gTOFfZhG6xgQwY1NbDNvhm9MvTf6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJINvd5z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F0606A335
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039F0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N884gzRy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJINvd5z
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUtfE3514869
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=; b=N884gzRysHbYDNL7
	eYyvrHAWLxssvbmjGZJYjEW1RkNykRyP5O4/u/dgWOK2y2WI+XzA6+7LM2ASPVg6
	tg3viHG83yZooUQwT0qGtc0jS96bKbFfMsc/NDwWaAwRtsXrv0UAyvBzNqYu6rGa
	nu6SO4AG0nO5TMYWp42/VbSwPGGmQemh2Yd+pGnpdI92bmi+ePcGxzt5HtiaAc2k
	WnqTekWv8rjEgh0AJMf/hhf3Y+qseNzWigL24D93uErFeRF5D1wmwuCv+9TWxg2H
	IxBP10NF/+Q0cWAbYQDrerp1YaYkxpwtsPcDEX6/TVwK7tQuKKKFX5ONDo4tQFoX
	CFRIiQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7uybx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso4967818eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372921; x=1795977721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=NJINvd5zC2KK2VDLpbbFDblfvBxWreHrAD4sFpuEJPCXu4jHGkYERM0CWwve0nAiQf
         jvJnTw1ZrCHHorNX9glEvcTNOD5okPY6uQyWXd3sh1rDS75rr9pRDbrHuQzW6FPrNgf2
         P5oR31su4jpdw2Io49cV7unXzYP3yQA476B52fjFP1HpDi9ZO030I/kYDxG1G9un/UdJ
         NzDqF6g/oL7lN+5bwo+1v/Xv08eO5A6biIKzZh25EIVE91vaNJ9vRzDGuA+0lD2HxYxH
         +a6A461N+IhvZ40VczWYdgjGiPrvPg9IcURHKlXgrL7pXmbOw+L+0FhyIyEtr+ut2/8x
         MuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372921; x=1795977721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1CS7dQEQ1nXJPldDP8CGgRWu7mKN/k0tkqKyzIGSEs=;
        b=NsFRiNf4LmKvZibdGjkKtGvqTST8agRZCM4UEDBPCvKXfgA+Qc9f6K7EhcMQPOjFKO
         2j29IW51ReDk5Mg7MX9+/NNUeMFj2AtRPj444jdwfD4AOxzpefphKiZ1OjDzgcCXlpFP
         lai0fgxd1OUraBiiJmKDwrhwwV/hcrJ45eW0b3i3czzhuyN7rLsgRrU/G3pp52S34OQr
         9ZNQd6ZKPMpdQ3a7gUQXcwNSHY4uCiAiuc0QqTGBhWDMR7S3PrCAfcKa+sc7yt7GGqOJ
         aCL0f5NOkPQbStMV8REiwlPy4U+c0feP2PQf2djyib0QBh3ie8SXVU/UseF1RyRaqeMw
         Eckw==
X-Forwarded-Encrypted: i=1; AL+hErH0/gXjnPjmR01VMhOtailJGRC3O8yd46sI9ar68KD/WjYNIjNE9y+aYo5wbtgF4fndEirzoKcpSXPkCYEo@vger.kernel.org
X-Gm-Message-State: APuU4Z+1dnAu2RV5xs/Pu3MepIMB+IAQbooZXyYzE0I5+m0aNTLHJJrh
	Jf+VPYrtQ1EuOJxgnnpbWVJ6MLQ8pccWN4Lz3bPnjJDjAEfSoCdKGiA1KkzhagYPU0+YFCT8cbJ
	Mf66B9HLRO1s4CmfhspFHD1HFJzlBq9LGQVBWiRUe039kVFbOb0ZRBx8F90pqD1n902jJ
X-Gm-Gg: AZFdTZcZLD0OgCz3+b7j83rbyyy0KveFheQzQKlMCuaF3GhK5L8HOH8VRyWtHcarI6J
	tvV278MgE8V5vrSDM7nyyQR/DUOuRR/Q47S4U6PBnMz+AknldaGmTsjx1YZzmZgoBZvTcaP9IDy
	HfWpV+LDbfLMnKWQKTVwXmL9EnLTJ7OIFUmbuFjmKraZVjrEU1afTcuzpoAJTmyrwN2HozD9Y7e
	EV+Pp4CI2cKaDv4pkatI6G6IBnA/4h4iUU3jC3c7ys2e/bW/Q7EVDJy6z6bvbD08FIjzPbe4xLf
	hZhQixz06Uj7KLeUSJJi48PoJuLpwRAWq5nSDZPEGxUX/qNF1ztfJoKqcxu8v5sF122va3Jbzdo
	tbbeTtM5scHihHEL6vy3fzCvB7WWtrDq8QZ9mDWQKbYBlGRKBjIfNAoaSQVVVaSDT9yq1ioSrYE
	bnIVHXmJs8uA==
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446356eec.34.1795372921401;
        Sun, 22 Nov 2026 10:42:01 -0800 (PST)
X-Received: by 2002:a05:7301:6497:b0:386:a671:899c with SMTP id 5a478bee46e88-386a6718b9emr3446336eec.34.1795372920922;
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:00 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:32 +0530
Subject: [PATCH v7 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
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
Message-Id: <20261123-add_shikra_support-v7-2-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=1112;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SZb8f4y+c8VKXAmObSVzyBxPR3uylj62lbyHSZIa09Q=;
 b=uuVTYdqXCo/Q0EWrQyqZWXll7bsLsYN5dwGnkov6NB+7G2v/fmXfsrJRS+OYu/K2nFHYDy6Nx
 E4mpaje6/ghAjSZff3MxT7d0OAWMfVUNBrigQ6vcq7E36Qtt2fp8v+i
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03379e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX7GVJ120p7FBE
 THMU3t4gf5PGDes7hvvCegVKw1IxFM95KbuwD1VIMgricmjO67RGvCUvpo6LLEC/XvCyIzA17gv
 df2QCW8TdXCT9todAzWY4yHm0BaDp4s=
X-Proofpoint-GUID: _SKSNKE6DqQn_xcHq1uabSvrWVPaJFiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX8ZAiKKwFsdei
 6fnbau0ah+R0XtfdGJJTM0uAiTmrTZA3jfbsbzghlkFL9RUqS33kmKB8LORnox+j8E3fWLGoS8n
 R8ubEiLzh+IAoNNtaQ7nr2Akkx1iZO7itrwnG7Updww28ZTLUzS9Tl6RTeagwwFGBOO+I0iTCPj
 NjVVtic+e7mw2bUPnsXnntfD99IJuypX31BeNRXeTMMg6+UDsxKGN2sg3xNWrjtvRweBfOQ+efC
 wd/tT+x7Q+aFbRgQA8wiLXlp4cVCV/Bg/zuy7D0x/p/NcLPsFvp8IIQbXzZMXxsU4+Ym2f+jPKl
 u6g97keKuS8kAnPF66MoVW+RAAOVKapL329myxE1C08xuFCEbEQ0fFBceTJTfkjkKgIEcbfV31a
 +ZBfJTZNWUfjauskHq3mgEoGWn7Ckb0XxqsnAKKEY2ti3yIWYdyQpZf0rZvoh0GRX75NPunPsE8
 h/z70cszbz5OlxyYPyw==
X-Proofpoint-ORIG-GUID: _SKSNKE6DqQn_xcHq1uabSvrWVPaJFiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Fixes: c73e2c5672da ("ASoC: codecs: lpass-macro: add Codec version 2.9")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

