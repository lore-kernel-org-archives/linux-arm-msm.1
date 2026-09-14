Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B8369D7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371474; cv=none; b=JgqlMhdRulhbYqaPqev+sbwt6qKrq4/74KY/2YEkZNnCjYSeIbAiWfkrH9RVU4cEGJM0ozJbfrcvjfACgeZ4INqDP8TZMPgKp7nN3PzODF+4l1P1CUhQmn8pQPWtpusytEWauBPx5kK05Z/AuQAVL7svHGAbavLpkzaDrqBmOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371474; c=relaxed/simple;
	bh=VhdJ3FXQR0y5DJyI4SL+Ih7icrcoQxHJ/kzzkLxnlLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7htAKbWrIW1W0/N5Lai4g8IU7yOFRtERbkjHFYVtsZQH8SlzXlBkiL1eXrWHr10XFvOMnJg7B5ru4vHjltKdsiq9ysi2hhqk+/x8mM37Hqcw3CVS1JRn+cWD/GBD7UKbbqW1vE2iGyJmCi6PMmLoht2zvxnMAkJwfOeg7fGN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBrEZ61p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnhZILmb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBrEZ61p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnhZILmb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ipKr2627103
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5KIevTjOfsqOCqIPoEvjHmiy
	dQ33KNJEBlJ4PdqeHCk=; b=NBrEZ61pJPE5vnlHjKse+4wiSAQcL6ThG3Bn/Sof
	btvSE/v9yryCIU7JKMgPcci3ixFBIYQKXpB5LTz3PRf074ryn6b6pwUFTc/FFaEu
	g5RUwmfl96k1IqPOwTPWqFLSmwkLMCap0eeE4p7QQfpjW/NtpI9/Ebb94cSP+dGM
	VeHNVyH/lVbKdwd7p+/5hpVpm9zgH9OGv9B2tyfM7AM0CcEYjdDwcGAXAykbn6WO
	a4OFcTTZ97FFMLKWmMvZ848wfOBJimz7shGlLCIXOQcbxZZL5QuPtCcd+ucWgHwI
	8uz/mHYgajKJr8Ao4Q6QEUuxCd4lVH8eyJs1b8VcP5Pkxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5dqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:37:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so64534056d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371471; x=1789976271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KIevTjOfsqOCqIPoEvjHmiydQ33KNJEBlJ4PdqeHCk=;
        b=SnhZILmbKx265zRyxCduecsFfrRGlYn/qqKlZBLEjpCzbuCdUbQJ++FtFpNH4yYCZB
         uVu2+YEitTIjFmYEzdN1479cLAloMiwiPa5a8e9L7xCOHmQ1Nd0LLGv+sXH/KJzcoQMH
         hI78y/0ZmiZw5uyFSAaVxZBObfeZg2O0m2+KQdU3z6JLEhu0cwABDZwFf9q/sS1ODgQY
         K4YxO3RyeGTwOTksuE4Jxmqt5x+oAMpqWPRtqU0cGnSsuzsA0Y9wquUhZVLV4PiWRhU7
         oemAz3QvawWiwVigkm2s1jXE7KIrf6LNYox0Au6Ygb71EYclHQpnH91b3cAqz3xX6/pT
         euRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371471; x=1789976271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KIevTjOfsqOCqIPoEvjHmiydQ33KNJEBlJ4PdqeHCk=;
        b=PyoViqi21l4qShBlvgZ5bXhPfy6DnwEDpGwecVN2rLS2VcMk/VSeCpkVQVstqdZztk
         EUPPuflykGuUsCx7IBG47Y0R9U8gGCf6EFt7ajZ5AIurhfSXVr3wqb0HNMR3VY85MYGi
         hAiV18qaVTAqT/zHg/jCjPCr8SiVqoACGy7zvBEdJb4TSxUFnJJZgKeSkF8VKrzLsLPN
         M/4mme8JO58egqjTHKwPGY8zCbBjCppJxUCIHa8IH5DyDVjO7mH5KhBHSOx5+n27lLxd
         /018ibWQAGFjJFnAP4zMqC1F52vcepg6jVtct0zxfTqd0aVnHBA8pa2n2dTVyNY4tHoK
         q/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXRf0KnOACJtwFt0DR2Kxw6P1aUOIXo4GV2MNC1/KhNYEAaXrzvnPoHVLSLgyQAt7tVZ+t5WhlC71LavSh@vger.kernel.org
X-Gm-Message-State: AFuF++kRGLUyLcstKMEwm7ail/6G+C+X2/EsTvRlkURJ7ehlvZhbZ16m
	5zF693ObSxakOPzi9dXkKTrgHPnAG6KTlDkp6wuwI2AspyO+8Gk9l36KDmLR9N4SAEOJyjufVtx
	eO/ipemSWGFEbn8QnDY5RREMdPbmYvXSLyimqQu1VXE4EfceAQpFsf9Sqai7kQXIa9u+/
X-Gm-Gg: AYBFou2P4sQNN7/x4zKV+Yd+hIUInS4IFptysFhRDJTLbSVTJFAqj0BXGw81E5/jzrL
	+SQPufawIc1meyGakccP2jDv+TYBqYyBC665OLhZXRsuAQBWJb/NyiAfFfuKvfGCi3u0WaSOLSF
	3iYY983FpUpmBG6bJemvMudI0wK/ML727dNEIJS4jQdoM5C1xX4sgmAs3fp0XYtxrDoGtE459rN
	6ke0HaVwpAiTybD/NPNcAohOnLXNeihxnTyPn7wrmAO1Ee/9UX8KvGHVm/rNE24uV5X1BV3i7ex
	hUBqe50ESn6geemQoMFR3L/a9s20EwD6SaJtEpCSbgmYWZYabnrRWa82z6kvP8a0h757If+DRGv
	J+SUPVV2x76xc8yI=
X-Received: by 2002:a05:620a:2b94:b0:939:518d:7f6e with SMTP id af79cd13be357-93a29807369mr202887885a.22.1789371470922;
        Mon, 14 Sep 2026 00:37:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:939:518d:7f6e with SMTP id af79cd13be357-93a29807369mr202885285a.22.1789371470387;
        Mon, 14 Sep 2026 00:37:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm24158035f8f.6.2026.09.14.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:37:49 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:37:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 08/31] arm64: dts: qcom: sdm670: Add domain idle state
 names
Message-ID: <mpnr6xpj7t6pktelc4i4i3expfy3f5sawecdj5ff55btkvzz5w@ngum2e3x3hsl>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: kOo_9-xqqUpr-ah9DGe1NomJrdbn3iOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX9cwJPJw6n8CV
 k7rkKmcO7jWibNfJT0e2ux0JFAWRsoq27GiqgFzSJeoJVYOEfpPS1XLT8o9zKOgtCGAHsJDM7FL
 FsaWJv0ocLK78hpNqq/0uDiY1cEFIqbW2yF6he48P2p9hW3crQLvgp8yeMmNFSPuV2l/sevQQt4
 zsQD5VJc76g7sCqKZ1vJ9nuM7+dI9KZKk2ROZsJDYgQiLKqDkkgTH3yTQHV/7cIqTr07qMGBtN9
 lAqRaTCV8taiFtLpIWNNlYROBm7a9EJP0bsQm8S4e1UAq1RzANHwNsktz0jyO9L95eowv1bhU1z
 BbApWqsGy8HS/H/sO0gU6NYmYH6cy5WAqum7aOSz2Wd/iGKwOGz9DwOaiKyQdRcAKxbnADRBJYc
 uvCCjvZvgBRAFqvJPISewX6rTSorM9303bjw6jhECnogpjdUcFm4b8jlPSNRhF39o4qW+PGfMVk
 Ra0svqSsOSHuIauAcYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX4gU6A7MN+Eqm
 RjSmEkYPJ4rcvez4fTUsoe3DjGL74ABhQQuVdwtDmACGa/+dYNqrTRXteAEFKlUUhWztE6gWiJ5
 DFH7qkv+YBBX9zuoI5+YWLSUH5DS6Ao=
X-Proofpoint-ORIG-GUID: kOo_9-xqqUpr-ah9DGe1NomJrdbn3iOO
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7a450 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:40, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
