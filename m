Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBE4B0E27
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595886; cv=none; b=E/mS/4FsP9j3kSV9xZCZUA1KkS2RtEkfmCKoMmnEaU70FXgyEJEv1f1d21YxMgJ8UJU0kekEdZeA68IcWJ3ETNjmLmnwPRmKYYSUZBD9NlMk6Bv6n6yTG1PeqifBK//8ccHnQZ1H+TFjHUJ4vfAJx65y1J0qgrIxEvCSsGMS06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595886; c=relaxed/simple;
	bh=/p0VSccA4zU4DeQiVeywobz5EwNE5arEy1oLTPc55ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCJZoikNpdKcGn/DQ2HKmNB0lPQWh/J50hYbUBfHk2pqjDCQhf69/80ANrptXlmvS/7jvDX6TtYa0p+5/BYV1MckA03icdHer3GlC7JGVMZnVRPCAEZNUOJqStWlY146bncYxKmfVdgWg33L5xPxQMHJHVxbLCuWh4BXDpmnm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au6rqKpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmTG96KY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au6rqKpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmTG96KY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAXlb4115872
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+g1gQEPVu6NTWa1Scj5gCEUL
	9c3gDqxk89YzewKsiV0=; b=au6rqKpDwMLbn4UyWq13uFvqH3CuRYWGBdBmzyFi
	gFptUnmPRcaA3d1TN0z90zkM01FPZK7J3dGUQePMrIyCT+KrFZ41i27k6EYPeTE2
	RC3s8L3gqOFAWBNBnbV66dcOrScRa60UNF7BBEeV/71Kmoyaf1/nbfz5ZyXf6JSP
	oUKCDk15cwEuYyUxTpFSP9PcGHCEAV3dwHz4KCjGBsSX0nfVL58wwYLYz3B/uayU
	R3oPJ3DQeis/NxChU7QBaOMpkfaxZWsE5Axbn7jlJ3tv9j3qlegZpeVHXkfmM7Ag
	SxHC3XvuM8FbnDYAfWPfTapKMcWBHBtC0kaiA0lSpmbYwQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jwtxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:44:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso2345076eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790595883; x=1791200683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+g1gQEPVu6NTWa1Scj5gCEUL9c3gDqxk89YzewKsiV0=;
        b=dmTG96KYmReOxFSyA5ANZXCQUEMSYWXaYcW8M9d6x2h/CrEYJ/Ir5Wzx4+VhpHfpLQ
         i33GJEibt5h5zflf4hUvuLgOOfDIWOjE9iwHbeRAJITlBqZrQDVFlDKOhQ5Yqtmop3cX
         nDd5DRx72NHw0qnVxbE3xmFojFGPtVU+DIp4UWQ2YCjDgQAxQSAGFn5annpE4ZXlPn0s
         qyTmwsUyUFXsUIbh0meu0hQ4rH+y10YIawOVP7wzUzXKou3ymx9W3wq9LnuNXQJ/idlS
         /WJv7pePAhvGzjh5aCVT9jemWP3bCw31QWJFJO/Q7RZYgQBIfcb4t2QrL9yf4G2Rke88
         Z3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595883; x=1791200683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g1gQEPVu6NTWa1Scj5gCEUL9c3gDqxk89YzewKsiV0=;
        b=lzXhzHpoPFDFAig4FgS9wFcsDvAaWIANVSPLlxN+TEr7vhtuw9zcxM4XHBSSS8uKhY
         cUjL715BaysYlSNcXJb9jCOlA5ywk2+1g5F2ws4Tub5qPpbGEmyEkEoAV4eAQkGnmLJO
         Lxpk0pZcM7ZvZOlZcoGZPqapV3D3QRmhFr3CVEAtAk61EuJ4PeRxllmschvqcQ9Qxk3v
         lWQHIraOX7HiZwfPAqRNkksiUoU9/PPKjovUwmowcPuqkObkUf9Q1om+SiSdoasTXHeo
         tjL3aa3lVf5hid0BC4ZVdp2OORY+j9dR2XIh6J3zItfs7o7Dto4eEmYVSFLRujYcVUnd
         CMDA==
X-Forwarded-Encrypted: i=1; AKwUvByc5XtfjjpwL0Mkwu5rWWPSHoD+APEreBqFEoKb1Yfxq8wXZwXjbQSlYI8vsFkAxnXTLcMFHxRQnefrP7yW@vger.kernel.org
X-Gm-Message-State: AFuF++mxz6nbwSp5gc6dq/PfTnXG7pgF8YEbRwoouij5C/ZYs3D97Gqh
	zjklSmYMQ3b+/3D1hGWyYReHdlZ7Q4zpWHJHbG64OnIIRgP/PoIJVzixQoB8FMA1NvyMgIWJyCE
	HkgizP1aY8N8wK/AZsSyt+0mu+Wvi9oA4gqmPrZhE73d22O+2HsZkI/VgeDkBhaEsryPi
X-Gm-Gg: AYBFou1bS++vSQvmpW9iN7m+xMWQandBa6H/rHew2U3afMvpD3UmW7O3cyvyNkV1SuV
	Pa6lN6D4oRFSpuVZR0N/nVHXp53+CIfqBxfaFQxmB563Enw0DXPo9fzrPDV6RKu78KjTE9cnyl8
	ZXfyMWdLqsTIKs5LZoU4vi0d8GA63UKlnV5kmyHivJ0HSn1+WH9/hIgkuW/3fK526nKYscC+ggl
	ww664zHVhzMdGnsOHMJJAe7qX7r5flfU5E7GIZVTF8E9++DYGpyF+fMRYK97rWOBUKjGlKPwRgk
	TRThMLx9qpEiY4LvoIuECZXgrbQSe0bFEoazkgnjOkS/2WFQzVMkv2TRvdywCT8JxwxJlWYN9jc
	5cYKfOIjAThA6YNI6oMflKbGGGKtN8gJb+LlINjRBKA==
X-Received: by 2002:a05:701b:4591:10b0:143:1bb1:3305 with SMTP id a92af1059eb24-146d0871d4emr8380056c88.22.1790595883111;
        Mon, 28 Sep 2026 04:44:43 -0700 (PDT)
X-Received: by 2002:a05:701b:4591:10b0:143:1bb1:3305 with SMTP id a92af1059eb24-146d0871d4emr8380032c88.22.1790595882565;
        Mon, 28 Sep 2026 04:44:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34a1f82e33asm4457920eec.20.2026.09.28.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:44:42 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:44:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Message-ID: <arpTJAyDAAuAzPrv@QCOM-aGQu4IUr3Y>
References: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX0k6gXESjMQTc
 X8QQzjvznY92f7JVwrlE7/7uOIRkPsk2KOB/OssBzILeQCcBrmjBAI28mwWDw8lYoBi4uNTXm20
 Sjo7mbAOaCQQrBC4fvt2RMGIrjwEF9c=
X-Proofpoint-GUID: J4SXzIjPNZ9G-F1ENBVIWcL1jqkIwFnz
X-Proofpoint-ORIG-GUID: J4SXzIjPNZ9G-F1ENBVIWcL1jqkIwFnz
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba532b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YW182EFpsI5OemYN5WYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfXyXHp/WAHQrLl
 XQcJ9B+gRXsMTO96Y4QTMc9pSejDu89rfXYqo434AGDUeYKUcLjqiXVzMQRa4HukZ8dJxjlje5D
 kXrJolwlqTWLyoK0ClavIDHccQs+W1knixGpw396gxKYclWDLkP4+nqhVVXDzJ+LX7xm469RsfL
 AWWGmlfsNpcGm5Qb4crNKE9xw53pJqWkPWwgPW0aeHeEch/q/K/I5gl6Of1HM82hW/OaRXsxubF
 YAiUUmsssjIhmpFhoiQ8DQ9x0klZFejPTHSreO15ESSWK/9ejlCkQT9kqCO+8ZQeQDqoPyMHdny
 xD5d2eeMGrSDPQNSyy8GLp9JYfwM2sGKyNxqi0bGkxx8x9wyEwbjggktNERmi9wO/rQcoUwN1oP
 c37lEOPkD57C5iCo3qxXQHtmOA+13b9wp12fhLMZU+U01pCcoCt87j0AT2KLiUTs8BXG8dqC6i2
 G34Oomff2rqjW4b+/5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280046

On Fri, Sep 04, 2026 at 03:45:41PM +0800, Shawn Guo wrote:
> Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
> RTC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Alexandre,

I have a DTS series depending on this change and so that being blocked
for weeks. I will include it into the DTS series to unblock the
progress (routing it through arm-soc tree).

Shawn

> ---
>  Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> index 7497dc3ac5b2..78fa1d5ed028 100644
> --- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> @@ -17,6 +17,9 @@ properties:
>            - qcom,pm8921-rtc
>            - qcom,pm8941-rtc
>            - qcom,pmk8350-rtc
> +      - items:
> +          - const: qcom,pmm8654au-rtc
> +          - const: qcom,pmk8350-rtc
>        - items:
>            - enum:
>                - qcom,pm8018-rtc
> -- 
> 2.43.0
> 
