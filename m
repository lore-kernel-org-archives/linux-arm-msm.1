Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB84469842
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448052; cv=none; b=ZttX89Cca1eoWuIkcOhWhG6CDdmOtmBkH2zGrz0zHXbJIeuHAnDVW4la6zedRt21Em2VrAlzBYMHrb0NVU7g9vIFoPG2IuZBK0uHxOMYBZNHXuzlOUQvIdWUaNLyURLqifqez6VMn+LW4ZBYTqSl8ugA4LbsVUcAKyaMAXP+zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448052; c=relaxed/simple;
	bh=k7ywAexLRndNEzyP9Z/lW896GOVpIW+d8qP+ys9ToFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hosCWOlCDxNBxMmBmqGSGGrn1KKkglYr8BreisrvbHarh12DQfIzwMm0AIhhI7MFS8u5j9rAtrkBEo0GP4oTTJVEGSSV6vn9UmONHqk/aP3mgihiGod13B5FEcKYtnPtg4JB4kHiTQwbDpVGapSHZ6LyYYZ3nae5I7hrWtPaUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m15sdaqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHYUSTiS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m15sdaqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHYUSTiS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KYHR730807
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 08:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RPo94BEyvNwelbWa1uloETmy3zp6o0uSUEe/frqI6g=; b=m15sdaqX3c6ij2vX
	odZpjW1cNIXmeVFel4He7FRi4Y+6WI5F1KtOHDM8hH2Rc4YAMEJBApl31/FFs9id
	WxL0LFzzErpl+/OIN9TYeUueFxZCM0dO/TuprNTvg/W2KdvhUTGavdk9qCLgCzqc
	J/V2NWyWA1vdLIK/f/WZ4M5vTXarlDiImnjyDXHxR+lcbx9RsOpEzdltKl++iMLp
	5XgJ3+VCuMLznAklgn9/3Q6DYfoDIcs1zjSXZKK8fIkSbjxgEvcr2YFnhF2YpBSH
	nJHYKaa2asmkkOW29nCxGpaAkdy5c1kOzeDpQi/mrdT4nuhWdxN+B3UaZAQo/3wK
	g7ZjZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31vg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:27:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532f343a55bso81186281cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448049; x=1792052849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RPo94BEyvNwelbWa1uloETmy3zp6o0uSUEe/frqI6g=;
        b=SHYUSTiS7y7WN0uYESst+Qa8h0amJEeFRp7YnYOKOWLlxMcQ6YX0gfIPDOXSSzrBm/
         m2rHoKeVWKVGiDPQqZFQ3gkGK8C0dFfW1EF4Llw6GXalAGCcYjeooiHijYfBsv3U4kPj
         h6FauPe5qP0VKvJWcfs/EQpvMg8YkHXK+WwHXzK4Gs1LhwvDUGKWiU5j1w2bnDf8OSmw
         HiV46jEo50/MZtsIu2530FD7dc7uW5OMeUWgCRbHzmPOt5INf5GuXUYg2mslAs520xZt
         Ta5fCdCMB1bb6f/E7+rc3ayubWSWsONuS52Yk4vQm1Bq6B0u+YSqJIiU9JwbbZ8pPj2r
         SPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448049; x=1792052849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RPo94BEyvNwelbWa1uloETmy3zp6o0uSUEe/frqI6g=;
        b=to5mVlavwPcnYI9QDui4zgsOrw3+0Xw7ucCpxCdglA5kPyn3KnfJJtPUcPOF5VcfFg
         fA96ShVqGoBzNtHnFOSl3GJm8YqL+BfU39BIX354VMwEor1/LZwhGX2spl/+kwnlT4EC
         o2HipI1TB/xcqtxcqHHhZhutJ7IhIAlsHYFanUmNhL9TnntPXSCdvPL8mCUJQlICKtAt
         WW5A6a7msCAXYwe4ElMmAc4+O8mDzaafNUn4YOuZpw/75wgJvdBgls2dSEsQuKnHeyga
         8Yd1yjQCO2sNqRgXpxcB581A1ngI0y7CzQyMCG3MQDr4RVZV8QyaotTRPdGp9B8HUlVl
         tI7g==
X-Forwarded-Encrypted: i=1; AKwUvByVgQ9h4r+kjT+CgrN4fZlWd9VB+K5c4tPAzbEB8p4LnVp6XUB1Jp++pHX0QktkpvQ9CAuU03WAtABNFzvJ@vger.kernel.org
X-Gm-Message-State: AFuF++nveojM+kjATb8jBGTuPdL8y6Spw1f0egiLrpP06UPsBgQTVp80
	5Ym+jJOK6U+j7ab3DXHGcw1dqsXiBTHBdF9ajp8K58XjmNCM/rYfJYK5o3uBkDQat+AJFPyF1LL
	UC9L6+MHRbZ7Su4o1BMY3/oLrur6M3uAUMY34qYYecRvTjqbWEQPP1bFWXExdMBKwHwiv
X-Gm-Gg: AYBFou1QM2HXYTdyYi0ei+SuMqNl38YRVI3Ip2MvGyKkZWpjvIn63q3/DrC1NjLoJlr
	oa6km1aTx8C5hOE5WF+C8tFQtwCrdI1F382Mma8masEiIkC0IaHZUfBc4JRM2BIz/4vHnXPlAHq
	MgyJ6tqN4GU8uIkpfxSpTtpTC+w0S2HbrfLgaAN6h3JMCu0SyHIdIu1pbOxlV1w/0r1tlYqbHQN
	JKOtFdpsqyReHtlmNJNN/Nvmh0ZbmY8EjwQExZLeMBfqu6O76ai6JuRSnlqtUm7GnnGOMcz87+x
	myx4O9Ve0HZZ3U9RSa1YPfuACkQeva7IIhyUjgIU6MlYJLhcOPAH4KcNQ5zDCgpTOUAeP9RwUb0
	SkbZGtBW5hiPhw9BsLNs2lhDBgchhwP7UPXUFtRBe/GXMK6X1y0/DYow8b9tQhhsalG2b
X-Received: by 2002:a05:622a:1482:b0:533:2ef6:d983 with SMTP id d75a77b69052e-53575590144mr91469271cf.33.1791448049033;
        Thu, 08 Oct 2026 01:27:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1482:b0:533:2ef6:d983 with SMTP id d75a77b69052e-53575590144mr91469041cf.33.1791448048530;
        Thu, 08 Oct 2026 01:27:28 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:26:59 +0800
Subject: [PATCH v4 2/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-purwa_camss-v4-2-bcf11bf2c650@oss.qualcomm.com>
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
In-Reply-To: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=1376;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/TJrDepvDQN4k9e00zFZKeEsnj6jABLsbv9gdVxB4I8=;
 b=Arcz2WkEgAUp7for5gmpx/j6Zk1z4lpJJh0w1eVw59uSpI7M1/npo61LbmniRDs5KyC0Y0+kU
 RSI8NJ2fMfUCzzOJ/1OYY6k07FLGEOhSwwHuZOCn/EKhZTKbVW7mWrm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX1mtarT9Xode+
 KkECuvFi9Yy8/7MqDMS1t76EEP6xdhWyXR23UeAOwlE12fT9JHccjDGoH4wAJh2c0S7iKmuaj2r
 uLZnhPjAV/o16U+OzggWC+cP1zkuRh1Ak3KSBgobjFI6QqcRWzugdXPKANGhsrzjqo8FK7eZNXY
 2rX8rHJIT1MphFIzgO1k0WaD4Xz3jN20WM3m8rx3KLdG+3jRgIJg1s86u7yp4Wi8quIlkmL/JLr
 XNt8BgQ00M/2c459SljHwl570xW+mXAfKPtM8R1ow5isdWII9WJNHfsTVzB3suhAHHztAnggx5N
 F30IUumFxC+NWdL064jNhjjRNuMgSxAlQ+msMhKckZKIXctWrpEbekw2l89wnZ9LqNqS3gajZbV
 IvIVTGHMnA6kUVU1q/ZKPfCDL7Ir1lCuz4C9Eyp7o/QubFcnFIuKB5NRfb1BDX05dcUgRafEZ4B
 dV+KD4wvzuIFo01CtYQ==
X-Proofpoint-ORIG-GUID: Vi2VfQAFy3KnF7mQtkxsOk0uuPJjC399
X-Proofpoint-GUID: Vi2VfQAFy3KnF7mQtkxsOk0uuPJjC399
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX7Iof28k9NXUg
 cwdpuiq+Xgfa0JrTf2V4HgLHtd3pSUE6aocMww+kd/TpOmrGrZaYulYew+cLxV0NCRo4tEOf3NT
 MJETEiBXysiF3GCTYGCecC6VEzKffPI=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac753f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Bfuyz1jv6nlCx4zFUcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

From: Bryan O'Donoghue <bod@kernel.org>

Use the default case for the common source pad format handling.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..b1d9fe0010e119059c539c20c238c3e050ff7036 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,20 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	case CAMSS_660:
-	case CAMSS_2290:
-	case CAMSS_6150:
-	case CAMSS_6350:
-	case CAMSS_7280:
-	case CAMSS_8x96:
-	case CAMSS_8250:
-	case CAMSS_8280XP:
-	case CAMSS_8300:
-	case CAMSS_845:
-	case CAMSS_8550:
-	case CAMSS_8650:
-	case CAMSS_8775P:
-	case CAMSS_X1E80100:
+	default:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -414,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	default:
-		WARN(1, "Unsupported HW version: %x\n",
-		     vfe->camss->res->version);
-		break;
 	}
 	return 0;
 }

-- 
2.34.1

