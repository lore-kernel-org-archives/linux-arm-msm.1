Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956437;
	b=XhCozD1rYeNtd7bsk3ZxHupvyl4A39W4K2wcLttqeKpI0GT4hAYHbVXscpQex7c6NWpL
	 EOkVP7R26XZE76es6GJX4ja27M45R4DqDIDP+BYprFEtgvYMg7FSXpezCQqBYPYwEpjov
	 ewGspsB51ZxE4Fl9SkBk5ujhNx/YkxXN7PP/I04PSx8j+iOov/OktQKKUQOoaleyqC6gU
	 I+eZM3Hsxyg3IUL5LhIAEtBKgkWSRtbeirXkjr1VhpcUNeKCsIWQTz89XlzAGscqca2yN
	 y5mSUOSfoIx7WqGVt6fvnl5HfNVoVGIt7f2dyJPqdJ0KFB0recoeSh1NKhB2zcTmQLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
	b=Ss7iOvZiQxhfj6UyzsxmNmc5M0kwOujvBeYMbyExMWkdtvKRKaWRCrU+nHXoHxAEvWfa
	 gYoa7qwtlKilj4xVs9RW62dbpXUuZBvgnjZa1Kdeysqsqp9K3EIcXQuZU12ugxJrHvAoW
	 DYWA2GZad/w54mrPcZ3gMxZLTgexeF/VCo/8ul1d34Aee12oIxqiipAFtoHEeAm/8NWN9
	 i3Vm2W44Lj6ldzDi+S1kL6lagxkenLaGmQotOjTcjtFKjvkB2CUT8iyiqoo7voPrdGULp
	 DN0PDU+JBksAdniyTOzvsoS8eNd/3VM/TipcEQ40jpeNq037vqUt2RrXgRcmWLxdD4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjU0Wgdo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUKcgbmW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9E606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC9E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjU0Wgdo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUKcgbmW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67ROqY3906879
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+mqe3MwnqN5gPVSMUZCJY7j
	nzPClbnClecQsC+GqSg=; b=OjU0WgdoKjr8OAJ6LFtGpoyEW9/cNidtU+wvJrDB
	m8tm26GM3QDPWy4vWs+I2K/WyWPB5w3eLUGoZpZA8bgkzkmfdrtk5LGag/jsIpHZ
	SCdxuW9FOLufbHmY54eNUqPAIYgd+33b1VqrRYvUCcd9+9+LG0lF0/yUqzkj237P
	jrWqmMezFGrC2sHuCBjt5ESGUTOiThx6WhzY1Oz12GRl4h/Vz9Zb0d33Q4SEpa6y
	AexRNBkQEc8bE7dy1/agGEPpLEdaIOJ6XZRrI6YZTvjFnzOlXQU78XEvVCu7GJJt
	OgW2xlF69Hp+nyfXP2qOalbBkau2wkbImwysu/w3pI10Mw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pat1kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:13:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d2a94abf7so334396eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956434; x=1794561234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
        b=BUKcgbmWWyaO6oaCLaFgKAi3x+3vQl8xa2Gdtwfrtj3/Ro34pUr/v4yZsdbijtqez0
         wa7nKRmtC7e3B0zdt24lm6L/rZdasf4HEgX1dqZIwzzgyZSElhBxXuULHsktg4XsYrBf
         YW0t1BB9O0qAwjLSOMY0cDDIMHZ9OYONt1uVn/Gy6vgcNJ+Vida7xJp+PrbsCDtzSmgN
         FBFLQY7SyHScpP1V+4Cdp64FA5G+ZVZWtb0KAPY8w7pBVquPlxc1G4CihhTfgfkq3Ih5
         Jo6DW6baaBRghQOW1lm0OgNekltINlMe1tTH03NHwHRGd+4kGBxB/6k5gzeRfEPaiXik
         81dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956434; x=1794561234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+mqe3MwnqN5gPVSMUZCJY7jnzPClbnClecQsC+GqSg=;
        b=OZb6729B7boftcAL6+D6N9pJRVyBlJTKSdCZJlxrS8SqVe0IfXFV4FEGKSzWksOjAs
         T3CxWmtWE5HN37Du7wpTuXGiiK+y6lDcggdoXYuddfXY7ATx45P0jTd2H/lIdSudM6v6
         ZE/EBIuuAzpNaLeWwWxB3GmEQ3/DWUxc9VR3iSTybzzu9nU6pMZciiiwuFDt/0ir781t
         GsVfxXXtNwdRp1ibGdmN8b7WUiqIejvd4fLg37NYBp9Au3r2criFUXO6dr6lGM/Dmo/4
         SiJCVSnSLRYWbl1nkdW6If6uE/eM9E2acEG5tmLG68/PATL2J7gnXc0ZQmyOmpuKZhKR
         /heg==
X-Forwarded-Encrypted: i=1; AKwUvBwj6q8bjShWWSHKj/Pl8zfe3ol1jrJx9WGfx+1i7Lv0+i+HCo4sPYtONsgRKQsT9OqD5bp43ju/LXNDJFgl@vger.kernel.org
X-Gm-Message-State: APuU4Z++YKpuWdVE6/V0gpzNwXW5o4J0ss96b7btIe+k5XKEqF6Rdv4i
	BaViW9agMXRBCusVGBDCoTls+eTAlZSQLsFBTobPWxW7MdwctxwD3ZyhCPKA+hRPa+gGN9KH/DP
	dtw6e+aPMjQ1ZalVz21Qhq2WxLOsMGdybGgcZRwlnxhL6LIryuL+AK82GbJQolpMCfEvQ
X-Gm-Gg: AYBFou0R++ZTNhwiLGOkjwkuETh1tpwf5B0KINIiwzQRvYDfn+iHtxlFoLbc+jVSKTN
	ADhyBanYwsITp+ffac6PGwJRCj7lXsWDd0XEvkugaaXCMS7WmdbgRrJkV4x6LttBZJ6oBWkVoea
	c2Brb3Z5AqOSv0m2q4Y3fYvsOdamJVbRSeH946q9rgndtEFDUyI4sGghYok9gVUQA8/+fxycCSM
	84gkYO2XFvOV1lV76Fh+U6xsYfCgeRAJjejLQqAmnKuVSthyzmgzwG0czUHiMfayMH5jvJ/X339
	yKz1xt8lV6TsBsv39Zlm8VkEIWu7YM2909tf/T3ChZBoRaGW1aolt0gTna873MkfQmjZ3+7pJAg
	dYm0c0vdGZwPY/OiitXhur2XGOcoosMbke2vpX2ObaYBdS60rUfKvs6hhvTO7P6MCx9iJm02e0g
	==
X-Received: by 2002:a05:7022:4381:b0:196:7590:8bed with SMTP id a92af1059eb24-1b25d285a22mr3210867c88.2.1793956434140;
        Fri, 06 Nov 2026 01:13:54 -0800 (PST)
X-Received: by 2002:a05:7022:4381:b0:196:7590:8bed with SMTP id a92af1059eb24-1b25d285a22mr3210814c88.2.1793956433582;
        Fri, 06 Nov 2026 01:13:53 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm7709079c88.5.2026.11.06.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:13:52 -0800 (PST)
Date: Fri, 6 Nov 2026 14:43:47 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
Message-ID: <au2aS7m7DrpA6B9R@hu-raryan-hyd.qualcomm.com>
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
 <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
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
In-Reply-To: <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX7daObg7ObDfd
 4uficAQq9p45nELtEQjEmr8u/QnUykM2nGatxqo0tn1lCcnEyaKlEE9GjdIwCst5yjhu7SejqZ5
 gqVknTCq4uia6rCasEkeG1KOOZEU+oz9LKhBPOZ4euzCIPs4uvHVldH1OwQJHptMxEpIycxRNz5
 FnWVFW9PN+NL9kFgb5w0fRQYYHtdBKPmrtwKsiG2XJhlwN6lfYHddwkq/pmIDipVhkrfjPyVfwp
 aVkO6uAf7x23pVGBOLhYaN98et4k1SLU6YrUlMOsCGv//nrRL4WwINnZLeP966beWwnnepyFpge
 9ip9Q/MXfrUXq3CXTpYCjkqEjqMTrk05I55MpbWEPOnDANctH/6ODnX0+JPnvHqLiDZFcWlw5XH
 lsZf8sxDepyaANNmHKGNlMULA3XWS8fyo0KMwL0aYdKDAtknZ+PKMc49KDd2dRWcfgkmakOESXH
 8gzgqE18dMMP3FL9jPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNiBTYWx0ZWRfX5ZX+BmLm5rga
 7fKAQPjTM9xiFNnQL+4MxOylpaeLWqKiLHI346EDcqXWhMliqM/nXDjs4gupB7NFYkUsKNcc3qv
 THPs7xdomZTZclwaIvSsnbObOAfQMnY=
X-Proofpoint-GUID: imCa3yUUqXs1btVzkP-_MIRCsVSWO1_F
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed9a53 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=E6EYp718zQjunR1OsgUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: imCa3yUUqXs1btVzkP-_MIRCsVSWO1_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060036

On Mon, Nov 02, 2026 at 02:06:27PM +0100, Konrad Dybcio wrote:
> On 10/29/26 2:47 PM, Raj Aryan wrote:
> > Add ADC channels for msm, quiet and xo thermistors along with
> > their ADC thermal bridge nodes and thermal zones for PMIC
> > thermal mitigation.
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Moved XO channel into pmic DTSI file. 
> 
> You only moved the channel, not the associated nodes, please
> complete that.
> 
> Konrad

This change is specific to agatti QRB2210-RBI board, if we move the
associated nodes in pmic DTSI file, then it might get included by 
other board files which might not be exposing them.

Shall I still go ahead and make changes as per your suggestions?

Thanks & Regards
Raj Aryan
