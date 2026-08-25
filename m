Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219C3D1ABA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643275; cv=none; b=p/Lb8XR6i1Tm0ufsCnopOkkcyNf405be3z3bRhaAb3QN7xuxB00k/0Cg8esKzluF0vKGJjY0FSlEy0M0/n9QA0I/5ukw2T78NWYds/9T1GsBEaRpPu3WxP7QrWesQvu13jzpDoYJQfaI+yLQOXzUOV/xjm7rSe/TxHm5Ubk+Avw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643275; c=relaxed/simple;
	bh=vyxandif7e2Gp1fI07oRfATGNarPjCLDQXEIPwqMsj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQvHp6EgMALgIeFEe727HqWuM7RhQpQzTYYjx7z/xCMeExQkNviEvvD8EVSoTGk0mDeK070TiJ9NE8OIcFUxmOPSluGmsXJbN86WQUfYWL5g7R+exXRosdHySNiY8E4GibT4G5s+qwt+c4Lt42cAxbZCEjZQ+x3mRrQ5c/xYrKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY16voI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLOrXeFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY16voI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLOrXeFh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RbLs500472
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBVWgoEVbNT5Sr8Zx0TYZA21QAWuf428PE7XhlhKrEE=; b=DY16voI31GQlqpoc
	rwvFVORgU8wBYhbpGGcXOl4xJYbnE5McA7OBUZr1Sc9saBkwbku7J1DBuH9DuEHg
	R/YZHQr39cVLvwcJBXKQK65lXtkgSKwwZtqNGN84xG5lArPC/v3PPyM9ZE8tqveE
	CPwL7+2/iQ20sW7OTAHwDNsxkRQuHmXy0/Z+sl5OLplfHkFP0anChhmMLR5QXwpu
	UOn3UnV4hx5q/45eVfYgQtT8DjOKBDu/E6fcwsaxtkyaAqsGbB9LDJ+GMprisG0u
	XB7NHWgkeBb4cXC++1qD0Q57AsLAkXKfRB8XsgR2qmurmcLNsQj4UDlKbmtKa6T3
	VIsqbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s2p47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:34:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso63460521cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643272; x=1788248072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBVWgoEVbNT5Sr8Zx0TYZA21QAWuf428PE7XhlhKrEE=;
        b=SLOrXeFhVK74MVH9sb6RQsz0pxE0Gw/fYcjNUMUeDKR8z/ZoqBT8lSXPo0O2ZTag9y
         N06puPBRgLQ3vmkZ7zMCPpqlES2qy+7OVpw7UIlbMbjsc/voThdyWqqfNIv4KJvpdfda
         6DguC6pYnHr6hYABXem8VTp1baRaYUEyVtRIJlQssoogEjiw6wLIBP2A3W6B0KtL8Uxl
         P02k3K9E8kQgopb8WejEHhfCOOoatWXQxBKjDhIRqkzJBO34XUkdjjvmMEKNcv76a/s8
         e9Zn4+0uPiVCy1cZF/tvpzisTLdquzcU6CkiN7q1Tcg7lBIrpIRMATc0PBm/EC0n+n3x
         z/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643272; x=1788248072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LBVWgoEVbNT5Sr8Zx0TYZA21QAWuf428PE7XhlhKrEE=;
        b=L4KdrhxDJbxUCNMmegh4N9umNRUTuSG8jRXpTEo6JYspDNlX34Ot4q66zq22eMU+iS
         B2J9AtgjlHbgWy82a53GozVnNoSSunKoV4+IHMRvEisJuXWH//1g79/REhBwK1vF4i61
         iREoq3ikbeXTpr/Ai1xNNWHAwFcUd/Mzd5LgXg0Hvf6lRCc+aVAXaBgGIRIp1pLHde9l
         gYY9YP93HcYtDoRp6Fm++kee41SYtve5WNv1XPvhQfmD2C+Ea5iOqIxfnVdNPtdW5J7p
         UecbHFw2rbNMe0NfpCN3OCqLdE9LLapIFrJO+nremQh9L5cJOy6r1XF086a0JoHXI5he
         ze1A==
X-Forwarded-Encrypted: i=1; AHgh+Rqb4bLV67XEAf6ZnMo2bjtT6QGKwUfRfbpThqAFgkl/ZdeuxEW0WmS5txApj6ABPoQMzdhSpa+/1+1iGeX/@vger.kernel.org
X-Gm-Message-State: AFuF++k50SvGFGKUw5dRrB7hlYLD57thtxZrSr2q0eCAgQyo18M6mPn0
	kRJAbCYkGgDL3L8yuZm5jrGqUfW0YDbtNZDzGZz2v/kkCmv4crmrev/0cM77U0loElaOZCbMtZa
	nMqcKVzxrJ1a7HtjMMyAQ3FQUJeYG5k2zi2VsKd0lnW8WUGKyz+Aw7vHRng7rS2EEsWNB
X-Gm-Gg: AR+sD13gZogpMrEamR3Me1CH/auneG4Qzjc8QIRNyVS1srLdkCDSIkvz2vB2zCygsQ4
	SOcZO7MaZdzOTjDS1W/ReJVVe/+Y8cQkuAbq8FtfFUVE7UD40tlZq2pKC+dzKcwAgZj8N5aNYgL
	+jHj33w62fd6kMFG2Ykvj/L7Zo6fVtS5tIoY4oZiAgKa2P/LJfotAdwfvhsoCs/W9fXQUYFCbqH
	1cYbhv237M+0xVorO449NenoB8Nz0hpD2wSlZlcFwpHKMhihAELhaXiaztFdl2vhpbIrLkKVfv2
	6m5+tNEMhLTZkUqbtzxjnW5K4HN8kXj0TQLC9YD7r56HNIVudo3tYo7+L3Ko8cQHDcXppGVDIuV
	w2ndnyt8pMEtT
X-Received: by 2002:ac8:7fd5:0:b0:52d:9637:554c with SMTP id d75a77b69052e-52e2f17ff37mr48128531cf.43.1787643271521;
        Tue, 25 Aug 2026 00:34:31 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:52d:9637:554c with SMTP id d75a77b69052e-52e2f17ff37mr48128051cf.43.1787643270949;
        Tue, 25 Aug 2026 00:34:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1790020366b.8.2026.08.25.00.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:34:29 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:34:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Message-ID: <zacwmavu3huggr5tb3f4pqxw6ca7hsxuaye7okqgoh5fnnf6zf@73yke2jd5eia>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
X-Proofpoint-GUID: g0oNDJz2fdoDtRI8h084oY8n9Yc-K5ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfXz9vBPE8/yb9s
 jukIdrkeGnx2oz6Cm3qbgqsT5DbuptoDlZwfEAdY5Ic4FPqkCB3cYWzmG7ruEp/YhbYMxvbTnL7
 fkLDyEPHA0bvbyVcs1Mhku6FEQuL317+n+YhjOnL2NiqnyaLcB2DRaFhy5Xr0jE3GySAByuMaGi
 ku/i74rBPvE5XomcSOqki4RG0ONpczgA4z6pxjBdDQD1gq7Dy0dd6FjqgkFpap/UuB3Eu7/9jfe
 jWWKORIieXJ9KFEW8p20LPx84sHysRWK7QSQD7m+9T4+pOD5wA/9Z0zlMjMq56EnDP3Hg6ICCCE
 gphqFO2BowNaa3hEoGjQqDlzpZF5ee+6hQK3aSBsNnqxZe9dW0QJPwHBQNBACgoAD7emmsh2uMO
 JE1WTaY6RzChm0XB88zHluOF3bSGN01WW/rGzW5eAStZ+azQzjzQetNFcre2xt43Saouu8LQTHd
 f8Roh55GPqVvTHKXpZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX7SilAAlCvg08
 GhT1sSi/t0YPl2u7hu/9GuXury/A0ZSsgi0GK0UpfBjT24l/YJ6kTxQTvDkb/BhGyZNyCZiMZEZ
 lSj3j+E/fhYkDDxDSFEi7F8ULB2chy4=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d4588 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: g0oNDJz2fdoDtRI8h084oY8n9Yc-K5ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250063

On 26-08-09 17:59:04, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

With Konrad's comment addressed, looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
