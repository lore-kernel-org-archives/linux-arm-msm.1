Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501609;
	b=5BOTQMClSFxnwYgQhMBRutONJv1q+rd65WlRRgd9sIzl2zkDkGd4rqiqO8OFA0UPZiNY
	 Xk8VqkFgncf5sC/6Cn48+vIsMOaMoZOC9vjyWCHBS+QmCPYLvPqAOJAFavHdhaf4/F1to
	 TpQydWYLduTEv0wLtALsAv0UoxC1+HQYcXT/93Kl2OiqXmu4d7sgLh3gSqlfT3YtnOewd
	 T0EJLt31PD73E3Woq1mWhWv2+B7czkuvtMBqpBlYJKRRKkrVrZoFX35VKoiS21oCHG5id
	 Hl2Yk52iSIGjwNrDE9X/KXdl95RHa5Ky5kcx0Bbt9K2lThcDNf/o3a4q09Gwu/1/lyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
	b=cq3ebss0Ej/+4nhd0eFtPxMeWp/kKDyDLbL1rScszuB4j2qhl/06beA9cou89ZWo+5tI
	 TVQjimhYrmFoW5zj117lQRv+YNogtKh1x0/6z6mrZ3ZnQS1URKD2tril1UBfs5dHpYIPX
	 vifgKwJe4lwGWYC3PI3C9icPaMHNHZLJOHNzmpwgz5siaMTvuxb/LTLu6ql9JP/n2o+qq
	 baObMZYiLUaJIYrNLugL69xb6ScSNU3UVsfHiUiynqfXQQrW/9WYhToydKM2GrFobAaaN
	 OUnMPDu8Lpo7CgLL9wcGbcgO1qDUdUzedG7n8tIMSSSIGy/t654XmrAatM05z3AmkNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbiecpSW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuTE6YrR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8993606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8993606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbiecpSW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuTE6YrR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwtIr1928966
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P8PnBpQSPjgMpKEa3DFhjRcb
	ocMPaeiZQ804/GTvmxM=; b=XbiecpSWGqbeXCC5HGb7RQpHgodCzVBZBjh0Un3f
	dKKMUM4ZgEkkJUxi7rSlgZyaHTAZzZsD8IoR2MfNIr8AsROurWJ2esbN97gFvUvp
	b8Ys9jwsj4/XodGQliBRRIQoOVJdAbhzcAsBMKntNYcFx6BtWuB3JLPrFY8X8wpa
	+UdI8F4paFUkt3xfu18a9cvUyvMIZHXHi1Kdfv5DeS3qFlVII3dSDHjTcg5NPsj2
	5A2KSbmpgPiLnmH803RHdLQr9R5ETRyQOzC0X3RYCNNgGFOqrUHpmbjQQng4c6XJ
	6USPdznDLRClNUSwfBqDubzAKOieFqoFT0o346uZ6gz9Ew==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntgd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:06:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso536218137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501607; x=1793106407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
        b=TuTE6YrRijRIxnGGV2rSFfP5CAx3neopC/0Md7ZyIMW7kO4OtOjFcbqWBSGhhLlAeO
         K0IAtnD2CGS1lz4gMxlb+yPtlRFEfo/yduTsiiSPyixyickIk0KCQ6pZLv9TZv8RPzAM
         NbCukuYxlnxP3f5iJF4AmM9mUSDdgU0VMfZRxiK08rw1R+e5dw8a/I5rnnEUEZabtInB
         J8dhHGWPbNBGVC87zztu9OMNrZtgB4GcgqUUtTlamtUS1O+myl3PlbGdzvNsnqqdpi6G
         m6G4N3bmRgxc3dzfOCk90tSTxIGZvoi3dvOAgHuSOtCYSTcysbNFuk7nMnPQ9b8PV08y
         qV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501607; x=1793106407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
        b=TEvQvvzUiY1hFOlN1QTP1sIzxfGchTJ/lmV4cZTcGms0jnTK78iq0EtoT094m+bQeZ
         F89Waz954TEeOviJ8g52WDjFYMyKTuC/TqRVsKPnXzeVHY2tC9con6sXvWFEWXxwn5Hs
         9hiSN+PkCKmq14KQ8RTDtBqtBSp4JJ5X+XLVmJdoPDDmWoEyC+TaNYiGm/r08tri+4P+
         FWO+AyaMQEU/ewQl2WVvW+2MXKuymj2pIjF5stYg532nqeVFXcuq76V4QCqJksmU5Nrm
         zpjdQxv79ZTTDr5nVdarVDP7DG+XkodidQn5vCsk1aRTD4/6rCWcibp/7z2Z9206JtIc
         ojMA==
X-Forwarded-Encrypted: i=1; AKwUvBzy1VujTnm1xFtUH3uaqKsFd5b9g4F0WlfQr11BRxUVHnLtkkgrNdkgnWJcGjNi8ZAM+Z61u6Hk81L8Gd/v@vger.kernel.org
X-Gm-Message-State: AFq9FYIqeNUWFiBOlunc1UKMc9hnjD7yVILX/VbUqp06szR+7pzALXu3
	mKjpMWnQ4Ajjv1TzvcnjOOO5t9tfrf3PeB5u8dpoeacwbk85N0/TRTEyWfTvIND2ShUHgs6YANy
	rIUOpqKSsFPx1zJyPYtGj+ojbFoqTNmLHr/AF9OcvgIhgpdYaPn9MnEZAyTDRsRwqRMa+
X-Gm-Gg: AYBFou1sghBRM++ZXU0r4cfc0J/n8tLZVNhbhDOphItxu25os3CY7YQ3XUkU9ijp8Md
	0enMiwxHnQDLowqBHkeI8XSDYgot65SaaRFrffIeHVySENX6Bo2si78IPpICCrZZIPZLnO3rIfO
	PPmVBbkpXSp5vIoPPre/ei1cSQTD7XsxOLjUch0DZwShLwbJawy5OC5EIYtyB0SqrBdz1q7yX9M
	jzqIAc0xF05d/CHhqzK/ZxFMEjDeAy6TcnKQWSNE5ckdf5oVeXZcqiukDSV7QdQzmuVCmF/Kh1M
	LZXRhhHW8r+YdecE+DrheE9ugbXFTtrh/Vu1W6R586vW0cf46qs7tr65oL2/bpYvXjt06rxANg2
	G4Xu9jsTskpLia/P+
X-Received: by 2002:a67:f347:0:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7cc7bd326acmr360821137.38.1792501606832;
        Tue, 20 Oct 2026 06:06:46 -0700 (PDT)
X-Received: by 2002:a67:f347:0:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7cc7bd326acmr360809137.38.1792501606247;
        Tue, 20 Oct 2026 06:06:46 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm6527902f8f.36.2026.10.20.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:06:45 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc7180: Use ICC tag defines
Message-ID: <w6wsx2id3nfr74dy5xuvcml6hnwrjx3mrhwk3zgn7lco5f4prk@p24kgufpr42p>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXz/qBHBb8MqPe
 o8fTvnNTGrWBEYqEcCoAVEtPcQXcZuRCGylfF73pQ8NEcdOFYIfUhi8VVFlBbPjCi6srxe0w/az
 jGvnu2bvQofCqtNAkUfiEPbWR8vJh1I=
X-Proofpoint-GUID: sOopbR-1AIdWLX8vStPiK8BOVxXz10e3
X-Proofpoint-ORIG-GUID: sOopbR-1AIdWLX8vStPiK8BOVxXz10e3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXzf5wUAKwqXNN
 o5bY9zkI/mR8eyr4muKT5aHDjXGGIeiVjvLyNS/RFgAOgq0NYZMVNXD7gpxSLJPOcU8uRpwbgn4
 ldVEys36f1yppSjYf5sq3DZcZe48n9D4NhfalWXJ+K8zC2RuHZ7UzUXwL0RIFoUFo3NvDtL5Vqt
 ADzW/R2zwW/kTQo9FcLoWnPPuSr6yr3PultWmQ+ybVt79LUjCOaKfzjYQ5KpCYSrSZ/clTOF8IT
 PvfmqkbZ4NmqqV1GG7e/cEXBzS2gtDMPGdDCaEnb2vLAa7OK5bFe8tfMDw5a1iVxE/co0IG0vMv
 nvLq3Q7A03u1PUs0ISzip34hLf47p9sxiQaBY3APmfeGLm9gWrCbCAzXfzlnioOJg020RqH9Ifo
 tTeKM3j8T3lKz004bWwZHM86aUj7+l0rBvjqXb6pkE6kqEHiv8N+4k6ojSZwvS7O/iSm92NEZ1F
 A02Jm5JMkEuxbKo3c+Q==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad76767 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=F3kk8pQfqi94-d1tg5UA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:06, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
