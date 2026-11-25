Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631042;
	b=3Yh/B8lA2XAt9JfxTD4pYJ7E/Yw6t1ANMYH6HqdODTmggutIXZhGuVwNnZQJ6Oq9X91X
	 clEqsjBHIn5vHgGomLbwfsBw5vBoBnD8LfaSN8Tq2fOus6007E5BxnGQTDof9s6HoZTFw
	 Hf9hGj1qkXbK8k6RoUGKN6EVt65nD0Cr5PgHTtPaWscS7JNp6ix0zaRW5wtk0fKwqSbmy
	 eVvrORVvPCusrdvKbT9r1qyF3yyo2rKDUtcoZods7VP0viQM3Mj+mbTlszoySnI32fPD+
	 M/n/3wQ1a1uqr5CtKAGl4gspUhSABIKtePQuIKZhckxfM+9zLiwI8K4gYNo/oSowMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
	b=J2w5w92kPL+Y3L1L37CWfwwiuRhCX3hv5ZOTe1STe6pxTkWATDtdD1+evUhWsnfkb76t
	 AoZb8W/+UEWOYG1lJT4jqq2dHGEEVVEc3kYzMeUc96LvShvOXfCzo/ZGT1LzWfczTW9Em
	 WQhcR1277OkigbLwT8YUUPQXCw2jkGCeliwEYsri8speDip6v+BJuRYlLx3NwH2XghRRD
	 pTELn+xHSRbVV10Q4+AHGLUue+iBVl1DnEIcYfoD+Eauicqa6vx+A7UnxKE1sWLgNRFTl
	 3eNZvuEaZZ+rEkp8r7pp3lnx5BkdayQGe02w5sihfi/EUEq/7s6prasgZlXkRW+4tww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SUWXYa/N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fckkPCzs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A260606A6B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A260606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUWXYa/N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fckkPCzs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ98v715258
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wRm18+EgKan
	EW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=; b=SUWXYa/NJtM5c4/BVl/c6aZet2I
	UNm1dkR++rW3OPHIjv6k1Ug+PqTynZhKjcEJc+ELQozJAAV9eldzRM7Ir+awXYah
	UsrXhk9Z8V/we4qHLbtvWzBQ+ZHIF99+SeIpmsfjUQUc+9Nk/8zjDrAr0kOsBEIi
	KJjCQBRyf5/Fmm4CiBhESa5jsULdh2hQQFUr49bWF30CAIvNaCLM/BdfMazSW7YB
	ikd3u+muik91SE32ChDDt8n34KcZJE7Q3XocX/rOROwTX1AmqOUajHTm12DYI45V
	RFeCBpLufRnTYatIeRifSqpx5v87aX7yuyecJxnOuSIR+jsyPE+tC0oHcVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbm5qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:24:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so1498503985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631041; x=1796235841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
        b=fckkPCzsGWS0j4GRXGa1KyNFHn7BSzeWac4GAqAwbp/d4aMcZ6HeZwGgf13mVssGQ8
         xLtuVihbB2/grH4gMMvj68nVdTgNPtJt6jaSKPDXzHAuF1ZCTZ82xabVuHWLxEEsVTiY
         ILdQUAb3aroq269Qu0G7Pe4e54gKdUl5uJV9EzqzXbHI5wE35Nk1hbQ30HFPvlz5pn/A
         uPDkWbVy3fY2cSmF8MV0yn0Sof0m7s3E3xBN68RI/ZzW0DxS0pJ6P89Vc0uvjLBoYl/G
         CcODN3EbiKyQWxUQwnovUsQRx6VfOuPaudAfEe5S3i4k0lNecnZGkWei/RcrlqkZtEbq
         LVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631041; x=1796235841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
        b=xq6cZk3xO/hs5hCxdkHiKV25RVlRb9ai8uPg4IJqFjkcj4PKoDPvahHRKgGjSKAbGD
         Alzw5e6Fm5iYJT952RdDsgIpGG0m3txydvrTJAHyGzk1E2bG+YXnAqLD796rJ47u/FJp
         hZ2iaUeU32BCWeX4DtwQQrY8+X+Glrx5Gat6Zkskx8XfQVr08kQkoa9Zkqg00Vthf+X8
         QPQpaoNjEjc+ATGB5OCD5C3ptMvZD8MGGn6ThG9zJVSYfeeaXptJVjFM3j2/QDKUASKp
         wRncqa72K/cwxIVONozpBViHp20HXEdylWgP2XLDno4E+2Ai5s5GBjr/ZerCe2UYeXyJ
         pnNQ==
X-Forwarded-Encrypted: i=1; AL+hErE7FczVaq6W9NmfPoNGyZvSjdk4a6AgmwMFsUbRAJR4QEIRr48ZuqyglHa6BesCWDApmhYGq34vn+OKB/+4@vger.kernel.org
X-Gm-Message-State: APuU4Z+6XqAE/ejMa41nlTwXph65/jgiq/gJK8ncUxsuzx5OQuHBBA3A
	C32Fjhetit8tiCJTIYJH1feqRXqHhP9/AhhhqMY1pmpWSfZlEF/lSH9Zoqu5KiEaLbPXPGBJ0T0
	0l1Vq92eYhjDNrcFWj3BxxXFmO5ZgymZ4pvztBDlD4lKvryw2kJ+G/sn+6aA+bfmbfbct
X-Gm-Gg: AZFdTZeebnxSgv1CiSMAC6W2BT+3GbrG/CSG/Q4BSPT9q7DeXlI1Bd+AB4D+QxBWDdN
	/H1TvObQNGyOh83MAXM8/e/qISPkP8vnyCO/fUzC/tNmkj/Mp6c0Ts43nIgg0Q8vqpeYVrD9SOF
	FFGV7tahrwT0Ak8d2pg1WjBf0x4PpHIdhdnM20AfsuRTLVVdL04ArCLkry/fxI8oNMKr0fWxF79
	nawQ2MwXDmhvW5uvTHHMYuGbhQofDQojP3GFRnWMnNTH7O4RJ+swwUiMRI9UQM408OzjQyBAiX8
	3pPitmFywL05qc7LeIThEMlZPu8rRHkqS8McEGCKeh0nH9vEwBjcM0iGluxwuXXy/cn/Q0nbruS
	BEDIAKpHHikjF/UbZ0wOQk8vKyoOXE/6S3v7HEgTnJjImWqnz7Mhw6cXvZT02uhk/7fGG7kFQQx
	lWdHN3
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3344685885a.30.1795631040793;
        Wed, 25 Nov 2026 10:24:00 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3344681285a.30.1795631040255;
        Wed, 25 Nov 2026 10:24:00 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:59 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 11/12] media: qcom: camss: Enable streams API on SA8775P
Date: Wed, 25 Nov 2026 20:23:25 +0200
Message-Id: <20261125182326.2767771-12-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXy/k49+rWC3tG
 qElaDE4btbs8vqLtXp6tAySyTzV+dQIw9QhFp72qP9R+/nDCesDYZNDy8rdyAtFjVPhhbK1Cejn
 if85Xq3j5Jfp2BFbK56OV6XCkD1fnZc=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b0727c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=onitAmIIXR4QNx4LYmwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX/Bejjmh/cNVA
 zedBqExyj/xVoI/GfAOUGUdbN9FawqeS/tpV2CeL1CCmSapPrnmN+tFId1sg/cWmlJ6WV1adFs6
 wAmfCbzHGRkrqMlLCERwt4rKegNbXQHskkO/k6NVxhOEwXQ0zBtG7eawnh4f+if+lK0n81dUcPm
 tfed0ghTbVIpD0MvUHYZ0O0tFLoz9iU6yjq8ioV3LMj4PWNdGqpWzfnAHbolK/Zw2pjdAlZRZu0
 rUBKf+C41RqOOSMRB+sxKhMsKU2DOz5zE1gHQcBG2mq6ZRupBh3ayxe0ZzOR98GL+8+9CKjOCZU
 2qntx9yokyF3eT2V5jpZUdg8rSlGg9CEYIQ3XgGdzPPo4j3Jkeu4Dss569SsEvzZzxdOXYmxjso
 24PuCyoONS6SoXNpwAQccMRJRVlq3gI3+hlVpwgO6w5Nz+exCttPDigkJoUT0nxkHvu4JDDpOx5
 PQBe4iZAA+gVmrV4Etg==
X-Proofpoint-ORIG-GUID: 2yR1LTHDKYtRHKwT0OAlU0stbpYrxa1p
X-Proofpoint-GUID: 2yR1LTHDKYtRHKwT0OAlU0stbpYrxa1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Set streams_enable on sa8775p_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path, same
as already done for SM8250.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 77fa80dd79c4..e444c29fe847 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5719,6 +5719,7 @@ static const struct camss_resources sa8775p_resources = {
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sdm660_resources = {
-- 
2.34.1

