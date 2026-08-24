Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4E3F788F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564743; cv=none; b=a0rFNoCi8Qt05Up+hbNk5EdZBzWNKYKuzSqU7LNAiIkxo8JBsVhWZpqRu4pdqGopy4FW1cpdeoU+NHyrP+IeJdARHIcocM/fwmz6Rfh/uPeypGMw+NdHFNkIPh7GRqHiBYjCPL9aYtWEEv2TnIW+gzvuA5kwsJIXwtwxL3T8Vqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564743; c=relaxed/simple;
	bh=bnMvwLJC+BpCkFW9TdFzACHhTy1kTr3HaTfQCl+fqnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ay9dMS547BiRvPgVrcZ7d5mWSjUrLP4hSv/AVBZz9BXXuDcHV61vUWlAIsDTnlnnmOqSFmK2YzL3qFfOuyGvNL5T9G5CkVzdBwlshEJ3zRxNd52DGVfreZ8g1yxEkE92Jf4QBE8rNTa6b7GUII2SOhs4J8vZXtDHlnE2bC7RMBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK3JpMcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NforAR1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK3JpMcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NforAR1x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9986p1378541
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWhP727DHorzitrBhFMPh+P+p7E7DjC+OzMOVUqdubs=; b=bK3JpMcfmH3Zn/3b
	pmH8Q82gxyKvR0urfVhkhd3RCIjkceDej+2WTw7sJlSZaguY+0yYOssyj3w74boH
	nAkZXmSIgXkzVb5xNIezE5nzfxRfevvzyWqpR05C8JUO+oYsVBLCvtjgOHlA+TDl
	AG/6fcuWrv71M/WJCZFa2VBwXuEWlHfcaX5lXWQtDmV+kDyilQyXHGhR6SkcbZ4O
	EQgUaMov4cQckBQ2mPyjsoxi+OTCqTzxNViZ5G+U5xyiGxRr/lUDaCmoqBRYmDS6
	hWtDg9clerUXKzAKKHNJiO1/1ETm4mF03GUYIV9n0ttcHZeTfRASkKSurpvqafXG
	QJo69Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0kc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:45:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so7411361cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564738; x=1788169538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWhP727DHorzitrBhFMPh+P+p7E7DjC+OzMOVUqdubs=;
        b=NforAR1xOqxBINw5enO0Phxs1SnVIMOYcS46+zmFXc5iM9MaMOLTjn3ePo1A2GStAv
         i90SRQLCy8kre5qBJZGWRXzSETCnUonHsRJAyOmmK9kEX35eXh8/1AavV6YW0E4JUKcg
         OPhicaG1XRCN6BLilhvSEHjmvYfSdSDZMsXelc4ISSnWmu4H/6GREIJP1nivPCj3Wd12
         hVVvdkI9Sxb/8bW5j8bxj7Mk2kTjIuCwDWe+9vqB/nc+uPOcmDbYmejFgsg8trSAf7sb
         0T4YJIHypPnoeHVtetmSJZt5C5YIPvtick1e5P4eeOFvvJ7sG+qNIiyp/F+2oaOAjKbj
         it1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564738; x=1788169538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWhP727DHorzitrBhFMPh+P+p7E7DjC+OzMOVUqdubs=;
        b=RP77qNh7N/lPPeSEZh5dqqKVZU7EWyJs4Q4wJKHq0j2SU2sZJmT8PeApSa0202AWYN
         5I4II95L5EAFjv+HiKu6t2Yw6ar885KXcIayBpgrAmxuMmjSoPpyJTZY/K38Phl1mA1J
         aN03meY8FD8F56j9ckyKQc1AVf6J5MAu0IRpb83Dteoa4azTcuiazmrG9FbWVtbgmGdg
         h4/fq9cieirvCOmR7zbwGBxmJJZhFj2TKcWmFg2rso8sv2Zk9cLmko7NsfVjXaF+5nU8
         pQMIuF5Jo9A8pRjORc+MnYn5/cGHzORhgo0X8sGwnOszVeLxDTm16Gzd3w9qmG6LiaKZ
         zTiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXQLY0IjzIPVOsP2KZUFJlw2uMaqo0lZCv+qI31h/owSW73Sve8U+uqvYne1tGb9Hf72r0lIYxx85ce39v@vger.kernel.org
X-Gm-Message-State: AFuF++mBLCNZyoBSVTIlr7rsojLZb/faOK7BHaqdi1iOlIcmI3DJbCQ8
	kge5YNZ2ghSQx28bHRixNwT/p1t+3iiwSkIt4zLWRRJ6LwOw74qJZpSiVEQhrDGv5iSOJoogBN2
	TWD+BZTFfYHrOESpmeoBw5QN5UKWy1MvUuf4DwNWvqiv7+O0oxZHeWN7fT7oPgwOnTCMq
X-Gm-Gg: AR+sD10jbolPq1IGqbXe81oQWOo0ShN/x4cHqmfBbT4wKc+UqV/FVhE8mKs+TzhO9Sn
	v3ZD5edOqo+Z70fBXM89/bl5my19MJDprMIeCurzyl7yp+UNOv9dP8+TB4wKc2wrlTjCogHGd1P
	tj+5T5WTPZdlVw016Q18hv8T0fnuv/5mB/aG1n5jlrPk3qkiw24N2F99uhDCiVsJuxiOaalbeXV
	EpB+vsZDRbEAWzVuUfxXc/vFkWJ0LsBetaObqwcSJhR3kuHQ76YByjpI/hRykuyInVDfAGusYlc
	RUjP9tZspMgokdE590TXurBp+UuAlrNqp8CCe48D5JfDA8Bgs0qwHJXMZ4MXEEVN0A9jJNF/LWd
	Xx0I7faaVrjThCsXQrr7hMD6q
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr180959331cf.5.1787564738386;
        Mon, 24 Aug 2026 02:45:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr180959051cf.5.1787564738030;
        Mon, 24 Aug 2026 02:45:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab63sm1152142566b.50.2026.08.24.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:45:37 -0700 (PDT)
Message-ID: <cc20c514-fe2f-41a6-960b-c22592d3eaef@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:45:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-pmics: Enable PMIC MBG
 thermal monitor
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX6CqsnMGstDe2
 zstgBH66+UVi58HM67JBcLCbkT1vUMo3a5Hdz8+3a5SiUblDHNjVv12zcX9aFDwvkzB2X3nuQnX
 uzkQlQzZ9gE5Ggp4QskZxWenrR8cFzE=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c12c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YRSyWayBu2VEUMgi7_sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: VQBTNKQdazBLi-8L9vhe08LffS2pESzN
X-Proofpoint-GUID: VQBTNKQdazBLi-8L9vhe08LffS2pESzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX/XYGld/KpKw0
 8J1weTZdJ7P6uEUApByZBshwl1U3pZuPtK90qOXojVKoGiwAi3t3d4GahWeSfQJpBK01mNy7Ieh
 L5yUCEioN4YCQogP73vHorf+sPSZNZaD2wRDqSipUcwAncY4LzZdoYxYSbNaUPiwWkzI0AnGSt8
 opdTbNu8dk4kLiFwGI2F1UuFVL7DBVDN/Qo+Nt1pxnAGqxJgkh2Bs9/goLt6yiLtvhd6UcyX41G
 hoTlFPnLkMSiE+3JuDCMhPIGWYgWF8pMcB4yCq54lcWhHxxhgY/SHtBMEZgZBHIZmNs51NfoDDq
 I8jHJpnDWI/btYPzTqc5Dh2sNGG3nbDINDUpueikcb5MqcE5B1Ls7WdxUQT+P0KLhwJKP0LLOoq
 Nf1Szbx8PcDsfe1B2Wv7UejuVKBgM74JsTQ8qhafYgJn1OF38BQ9fxrpq+uPkz/RMreGsic+r+N
 F7GhgHLNPhWvKlUwLAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084

On 8/14/26 11:51 AM, Sachin Gupta wrote:
> Monaco boards use PM8620AU PMIC instances that expose MBG thermal monitor
> blocks handled by the existing qcom-spmi-mbg-tm driver.
> 
> Add MBG temperature-sensor nodes for the PMIC instances and wire them into
> dedicated thermal zones with passive trips, so PMIC die temperature
> monitoring is available through the thermal framework.
> 
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
