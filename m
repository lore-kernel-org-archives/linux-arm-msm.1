Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378548;
	b=CM+k//YxDtuV5Kt8Y157bI1WpoFeBJaBf+h0CQj+pH5uoZ8BVMSjSRDX8zme+Nmq7Lt9
	 hw8DDrwMJ//krbbPnk+4y/pEtiLrBFDZazo48wQF3tZKlOSZhRDNP7XS5aq7mvZbAvMid
	 TmEFLQ5H8PTeeIFx/yZIh1O6tQePxdnjefi1fmcrVG72rRePQ7DVGi2UrQBS1J465/3hK
	 wHmWQ8O6ZHwKYg/YTwdJFZ8u3ixRhFz5zY+sF5CVFqSkHpqk03/n/fwCkOQLrtZYKaFPo
	 DGm+QtcutW1X3ieDkLH+qWsFGhcnzjzwpmFMaPy9JYhPXROL0mK7oOwMsx03mv/cEyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
	b=UooyJ7ejG9TcDqFXFcprFi664L7d7Ryu0aYeZST3Wuc/XyCtVaC2Y40QTqSomZfawYth
	 hxo3E7AKWSJPnoXm5IWejawgiJU5VJvIEB5heaKVNvAcURWz4PFh6h565pxEiJV4kiATk
	 kHxznYH+LJDVf10SnvV+Yw1gNUNAZsYIyKgCcVQ4MuOqEeFSeCFHsbfXKhfwYd2924T4I
	 A3N6KxX8qgQqg+RVaOH5gfjc66DTA8mQo5j+xtl8vSsVSKSJh2gG21vFdaK0H1DO9/tcb
	 6a8nyCR5XvPBdtPKfvPdGtUPOEWFqMKfHgSqcoLIGa28++fdo55Ujbg9nEoXAER7mRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2A606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E2A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERD6B346987
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=; b=GxSHJkUC5198O8Ih
	SFnWSUT53ZoG6dH9Yayj4yDGKREpJGRnLtX7RA3nqm+mNj2g1+HV5ahmoXmZ3B3a
	7W90tx0e4RUB2V/PFsJejoe/qQxXh49tXekVD2f8n/j4QlXIyBHaZDt9UKX2Z15Q
	k09XkDyovLji2vHvW7BiAzDzTBuZtiAJIBp5EzZ/Ebri7RjlhbpfhbVQRFxHWICI
	JSHBoYz6hpmjNjFpd+yLZcsUFuSflhVaajs5+X+BPTj+Dtl+fredVi/giyAyGWZu
	2NUU2n9ydMEowgV/XhZuNPdSenzEbbLtfsqwToyBxfANnhaZNTWVjhhq4AKxUDjM
	44yTyw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rm5bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:42:26 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-7051c542f0cso840812eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793378546; x=1793983346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=ZbeKqZBPEpk+WssYYbYsqnCrGXDed9tH0gpmBh+dH1Q257uHUdPvy4EYTvtJF+dr1r
         kZY/L+ZcycM47wjCKjkVM7ByrtqHwJcqd8IHg/jkxagDzTbHCMS4boNbWrRBplKoY3y3
         q/ppnPMVXfTk4jEs5jYM0zb7PXR8sp4p5zO5phrhVeGz4mjm49vjYdmDmyZWw/QiNtbE
         t2iGYWzMfqeEXg9s1wl+X5y4QZlf7bpz80svXM3RX6qjctm9bXKwLAZlYzmjSeNT20eM
         jpj2gAgpSz+sHhxqY3y0H1TsQoj5T18IUYmFaoXh/2tsRGA397og8Qgbc36Ip3CTWKA4
         i0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378546; x=1793983346;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=uO/Ci3nDxLfFYH2ITwwQTG7ESRUC8ftzV/gzyLmNtkQlxxvuczSyHrCE3YXRNE0hAX
         sB5P73QAhRBgu55pp3r8nBHKbZcoEB5cchKEMRz0Kbt4HAYm5yKTrNJhTgJ5kzpOFxjU
         Dq7gBjBQFgzmzCxLv9BYaOmUedP8iZzoM7pp6m95o/NCsX1BnlNWo+i6Z4LXXpnY/Ba7
         JjkBqOsFjGTfFbgBzo57yM/Kc4MvTPT2S9bYnAx5kdd8ZzFTUj4HyGWAvjUjwTrZDwGP
         nJyuSNZekg8PDBLbe3H/MXOndnaZHAZ7XU5pdGBw5/hrVqugsXy73XSkyjwqL6nvDYHx
         fqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqDfEoPp+68FQCk/TNDNhaxU9x/n7/ZG6eJiJMW8o2BTYOebqXZzzWqBqO6eEyIEzJatqn7et8iEWTXVZ4@vger.kernel.org
X-Gm-Message-State: AFq9FYKbWZtCvzSGT2RGgjSI5LjTkqP7gM/RvKf9g+ehddl6lzzoRaj8
	2VmFIjQANEGJUMfVIBHgMMoUE4GvQKAkznEq7Ckx/Gx6Keg4JAnlJ4OI+s7w2phyLAY2AOf9FR/
	3T5f6hw79yPr9h8pqFm/oZIvsXfXHDzqnWdusQhN7bLHzQ/26ECJXyVgAEzlVXjvN8Y5V
X-Gm-Gg: AYBFou3RAE0d49IxjbzEAIx0vbVF+K4BB3NWyaUZcxOgQgEH/oI4qwyzhfSVhN7xklS
	QYEaD1pr6gdMCNnwBCSUSgazs4QSsMUINT8y/QXDtUiwXkels4azzIeHE9ejzKMjLO0sr7iIYmj
	S7oBbgbvE+eovcy3V7zpWSGl2rXsYEr5kVwzaRnTjnSXGuTQvzSC8UeYnsYOW2SRxD2NQxBOF7U
	MbH7bhRwBKohzGirpMIQmn8PUXwkkaK+4bD7MVOBbJgir+0pBsi2fhZADiXxveAcpkKHOA4iZr+
	5gZ+3VoRYdrDOJ5MOcYx0Rn2qHORD5nlfw5xdZW89P0Ho8t1NXOHiMiIWtbGf9HH41XAeXq/MYl
	bakkSGDzgK7OCiRMdXH3s02st84wXXj9iJuz+8gVDVVJ5MO9JIMFcIAq06gv75+MR185pJSL49a
	M0
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576136eaf.57.1793378546006;
        Fri, 30 Oct 2026 09:42:26 -0700 (PDT)
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576112eaf.57.1793378545592;
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm2364487eaf.1.2026.10.30.09.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Message-ID: <d21ec697-c3ef-4bcc-a74f-128191a417a9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:12:13 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xUurpsoybrGHs7zS9HM67lL-tEIhoIVN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfXyh5VbC+gR11k
 9Iv0MfpfjkzYI7hrvPad3KSN0ToHohUqbvr6B7UcdN3tAtOqGOkjJ2e36oSNIycPcqoaTd88X2f
 8ytCI1CvbE27hyiru+63YsPC5WoWkn8=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4c8f2 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfX9+xEXPbLFa2j
 hv83CXlkaTBbQdwj35MiuXI3YfSHG7aBC8e08GlmVWhHfphlcIzTbLVWV+DsrA60YKNRlgg4Bm8
 OKWdIJ+JXJRI2xfSB37tDLGGFDxTryioq6K+suu5GgIPeR9SqZ9FZ6IKfCPm5v+5TCiIvv6HTev
 Oar5Up4ez7n1vSQ+LqPyuYrt2gAVWCSb+yhAl3iNmo8fGBPOk+O1r/z107jcLhahigOUkDCA0i3
 TQhFisBASYHAiJfPGte+neMQmYlYOnSUhvvGnsAsCSZ8KAjDv5dT6niZAn4xx0E66u67wrLuR57
 H42gkkI93vvRgxemHeu1p8CGF0IT7SCtXkrjnyYjFeDDddwVHxdZ6R0WrlYihSekTC9hdVEJhc5
 Jf4vBriMnleEXB/P4baAtK/YrBTJb8zNiQgebf3dTnUwSMkM5/jV2EB2vWsU4K+sZ9Hk/lAb1eg
 QaeTyFr7rfUcM2lJqgw==
X-Proofpoint-GUID: xUurpsoybrGHs7zS9HM67lL-tEIhoIVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300066



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta

