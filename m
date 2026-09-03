Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3345E3EEAC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417475; cv=none; b=EpTjgXT9cU/JKedbBvKnm5tskpUD4EtSyy8AMMQk9vajU9Fw1aPgyrATI493hyD4Bt0LFhmaG4mHZLHg6esrw3J+XaHKmKhOxWCHvWPbjTU5r3o1+0AqprXrs1Gf8jmQWRmW2Kp7I952dgRK4K2DcFcoXAj8yuDGU6GKEvDPvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417475; c=relaxed/simple;
	bh=nZHYuewFovLeJ+5naPia4RsxMaLt2TuGBHxq3tZ9DZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ebh4Lqh2lC8ElaT6E3vVgcX8Ed9QtZrdODuAoBGSzKd7sWStMSsM62w7XpyrNEGsUPj9YKF1l/mvBt/hJEfOpg/mCp4/ACnaRJMlag5JztqRNdZ3efcFWYScw9U8KfANcSedwN47gFqHmOUOT4msQvnCvB0OAIauYj00ZhjEwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQ29/Lxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8uscEv0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQ29/Lxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8uscEv0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835ldEH2596858
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=; b=gQ29/Lxvw3aaA9aF
	S6HVwiejxuZ6+3MXShztUOQM2QUgqxM4vEJXq5P3lSGhLrulD6bAjDFbykrDusgW
	2oLk6AMkIGNF8Rsd54hC6AA9bZ+Y/5ttGUSjvNWnvItf+/FbnIhNtMUdaGvYzTrb
	Q6MPHSKGEIEtP/EzoTt8zQto36q3QMjPnRZNZgaMEIBHhSTWIDZn5tfZsDEvkJje
	8ReyRX2Brcy0C+Gz3Fs8Q1tc04rylv/ggJB+myQp18wVhDQ2KA2W04OZs/V2KDH7
	pgN6NQaBGbyX1JXdL2gjqVmj69nPLTQDgwknjw889DeuOg5CYbF0zq1b4cl9jRp4
	jvilFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja3wt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:37:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ea38b1e7eso4779891cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417463; x=1789022263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=;
        b=G8uscEv0reXko9JGWWV0Pbr305oo0+T5a9p6ZvaeYBWOaOchhtJRl76mfSX8Ghk2Dy
         RPNfn9+QIP8tDhEp1EwNk0BsceDMULjg+PNhTlRHavMfbUMxmFmyZfOCmrmwDhtrumQF
         xcGa6qz+UR7gLWZzCS1QFp9ZrIFEEVpH+SZ4D15jQy9gL9QTHP+bIQiWf5BdY7CRLV7f
         hPwovIkc6BrYcnZTl6I4BBwzhIPjZYu5DvJqlXZr+zkpzriaPc90ifhvhkIi3GIdbTCv
         34jxKWJrY6SsMUOIuwnPlEymPgRryQBBaUMJgR4MfrB+F2kMb10yl4QOn328UoSAZsNC
         +WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417463; x=1789022263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=;
        b=SVc2mwCPgFOtT/vNbJzmKhwuVFaZDXr7pjlqlaexlIBMdj+Xxl3kl9fK2XV8M+AfZs
         B/SmEZ6VQ91s6IbmoRm1f8I1Y005hOZ6CInwd+yR5E3+gHmd9hKZ39laQBFYOP918M3X
         6E8rIVjf+s6L3bo+QldBYOol2FCchUba4KCgtWCJSbSKGVOzpuCWDgDClGOEx6jTZ/wj
         0ARTtL5clnho1w9UuwH+coDZQwQOqyCdXsPoAGGYttsNgqjrUcWXjyiBzsyXN42ju85r
         wMmhh6fIspwwwAOy6SS1VRzwZxOeR4BttzTAtlGKeA0XLf/K/EMWmJMz19qmgkhNy8sk
         bc/g==
X-Forwarded-Encrypted: i=1; AKwUvBxfoTbbafye6GV1peNlOFbNZiogpN2UR4ATkoy+F0T6z1tZw7rddCVAbz2SAH5hYAhaTwSo0dLeB3hMXIOE@vger.kernel.org
X-Gm-Message-State: AFuF++nPRnEH2GWk/1hsPxBIhq83MU6ttpLmlpyxN6GKnATL/zegvIjl
	1BpoObPnEOLsqODpGW1MxRKvItu9mPeIlHXtEcbeLzmQuBwtKjU/Rrhhznfzy2j0O7xtbTlJ0wB
	24gjSuVRlfWBqKZ2vTmmPTW+bWMlT+uZr/pbKZijiC/ByLBSHcSnHA+hj056oGN13+zDV
X-Gm-Gg: AYBFou0sYJMh4kncWNZw6ApdBhXIIl6aSQW5ps8rqLaYEhyf+HU+aJ2Ruy4KtSW7/9M
	Vo89EI5DukNtkiRNDlBQ7rDNv6IhFt5SL8KMgIOURPHuc3cjKlR41YEpDuHfZaWTIjUBofC+yUR
	jJ7QZAsteAWFd6OMv6tEwmtAv+mc/ZUC0QtPDsQgJ6kVrMx4kwLl7bzBkcIjn/lTmsuatiUTJUm
	oOR4OOzP17uJZKwuHEoTcT/ijLuL40P1u/Qs7wXq9gewjqOWS6mOOXs70lilyg8FJ6u6XZggaXB
	WvoBqMSYRdZj8/e0WfIbADBycrW7HB/ugoFJGqvTD51yZ86c/NWH1cuLqfB2dndbk8Fb34B4/AG
	S3OAiehi7hV4aeHA275iWfA==
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr73180781cf.2.1788417463403;
        Wed, 02 Sep 2026 23:37:43 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr73180561cf.2.1788417462938;
        Wed, 02 Sep 2026 23:37:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f953223sm1781245a12.28.2026.09.02.23.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:37:41 -0700 (PDT)
Message-ID: <c4af75e8-5049-4cfe-a333-5c2b58e1da2e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:37:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-google: Set i2c3 frequency
 to 400 kHz
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-1-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-1-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q1q-H_dpAeWTq2nNyrZtuWhYa3HKyBO5
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9915b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YOhxEyfzO7YiFk8NLKYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX29ZHmCRQIjIA
 S7TrD1wL0PzrfibtkEd5jDsoNDbHL9HxV1SJNefDytMCkW7O8wO92aSXJLZyuO+dpRPj+go2iJX
 OUMB8Psqn+u2nNg/bvXeWxXyF+BEH0Q=
X-Proofpoint-ORIG-GUID: Q1q-H_dpAeWTq2nNyrZtuWhYa3HKyBO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX+kEXe0LxYgba
 KAOm9tP/RRCkxSGIva3EL1HoYLjLBzxemunxaeKhQ6VG5X/kV8i7xuNzaKB+fcCdbRfI9rnLq4S
 Do7DL+hhIBj+NNn3bGB7XbqaNKVEnYdt0GJD/yMZD6pqnj15FwFlq3rCsSijrs6gskbgEBPFNxE
 HY/zMwGV+h0BmVHas90cgAssAPQwHYEL7VDhuE/F1bE67YUi7zYaUCE9VhKYSf2sh1XYM8LdoRn
 65kpfkNGtIR0De/wMKwkYqelfuhFzItbBlevxMIx6i2VX+Pm+LMDumu7NWtZMh7lwC+cITPsJQM
 3/vLGOd+wM8+lw6BLkUtiIwzVp0OWMOZPPDMVqFXJbNzj7FUNQSSOTi7OF/phxcENhSP8rVJRI5
 cqWVLN9/0Kq2W6PIbUlXhDXDe8+ZlxI0HWzJ4vSF4w7RXcrfDUOFI66g6uf+tO2PgPsX+h3dpCe
 ipnZ5UYj1DL2r1YUzRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> When downstream value is undefined, it fallback to 400 kHz. Set it in
> mainline too.

"The Device Tree found in the downstream kernel for this device doesn't
explicitly set a bus frequency, resulting in 400 kHz being chosen.

This upstream DT also lacks it, however that results in a different
default value of 100 kHz. Set it to 400 explicitly to match the
downstream kernel."

Konrad
