Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186984399D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 20:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752185; cv=none; b=ttgaCbdcwvpMvPvcC9QdL82xzsXFiOJPw6vLFBDbYGJCBsO2n0siTisSjMxw+iywQ817H9h8csMNwda57yVpBPPpNsaF+T9sgqMU2CW5qwFBJbaIU4qfeUs/yHdoKF29cF1yf8mdzc2w59dvzOrVqRppkg62AjQ8zO1uQDNn+Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752185; c=relaxed/simple;
	bh=GJPIpuAYOH/Cd72F8JXZljndf72BGP41ynlicTsSZpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElQH1CAJ2GRlC74HfYSPwUn3KUFpCAy343LmFuJyB01DBub4WfnxPMXGE0+WJpGwXdSq1f4TPoRnWu0PX55e7RmY2r5o7DrfM/PRUuN8c2NYSzEDp1nTkQUjrWKDnAa9pT27ufJpMrJTAOv2ziho9ku045hivT6jJ5BGLj3ggLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVj6vpfs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVj6vpfs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f752b3423so3089753f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752182; x=1785356982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJPIpuAYOH/Cd72F8JXZljndf72BGP41ynlicTsSZpc=;
        b=YVj6vpfsHVUTgex0kjgtjlXW+2qU9sKjauhrevC1m0jze73Y5brKVbVr8fTOexZzbz
         QNhWoT2lYPwAB1dcbOII0Vzi/3iBlotuc6xwIbg//Z52C/N61y/dNykPk9jrKfEt6Wke
         hCeeU8e9i4J0TacJJEZ+CB5hvwsvMl/twQ3QGt90sSVFWCyOmbZTW+FtZSwr8W/fBK4q
         A5Lh4tIwwKrOCWSw44K8wTff60NxMn34L9XOQp4AovB7qvCPvUbZHQmeHMA5bNM0sJ0N
         MN9Y8RUhjOQWapUNgN0StlAsekorRZFfvcm+7NgcfGj6BZSF+Pe96bdHLuD+hnETc4GS
         IXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752182; x=1785356982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJPIpuAYOH/Cd72F8JXZljndf72BGP41ynlicTsSZpc=;
        b=EBa6/7mKuiqubjx1+sxazrk8JoR0rvVHi3kqa4jomkTUg39lKHiuA+XReYBBm2ouIW
         a/PQUnnNp4OoaIUNBp/AzBw7IleoqLRPLl+Attj0LcMxyK3bVdUo7mjemIFZclrayhIN
         TXy3CWiheeUX8e022MDM9k6zABl0jjZWb42vvasL+UUIWunBLqVuRlls6ONYK3Qzrsd5
         Xbr2XmFpwNxbz3hv0htcKWPHQ0vZgm0gu0ixZceZAeex3njrmiAmu86xBo7xucLfJrT7
         aeBFW9FTyYJgONuwssdvffUfap1GJl+zt+I+jfwi+IhmfrTot+tUqlVXBmqsEFEFxSjr
         19Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rp//5HBcU/n7QK6IB4DWwQhJYSfvv/dRTxbIyBHV9xrD3pOq3IsYNoRU/OH/QyrHvV9b7L4LroOmLg2JdMT@vger.kernel.org
X-Gm-Message-State: AOJu0YySiXIoL3/+cLXAnRVbQKieDIx1Sy2i84Rnd8CRkwFfgC4RnYqB
	StTzHSZK2zievJOS8lA/YFFdGFCxDIsQ5jCHSQPbkgMpXMrvh5MSS51q
X-Gm-Gg: AR+sD121tZhADwlXICZAka9XiEORZYYSEEIOZ6kwjx4UJviBpxt+WreJDd0cuAD++ai
	e2VNlYxlgRWFWUXM/rMTVLOmoOHs55OezDvrNYZ6cxu7kltCBR6pydb9ZhlhQ27KS6nSdKZ7aUb
	jHj7zY1e5AfSltYfzwn7+HLIklNeqNpHTSKnnqKwTFvUWsbt9KIvPnp7g+K2e74UQ2uLap8AJxN
	w4EcKtPLe4pNsaAUNNs9ADE6w3Ws5JnLwVzK5snTJFsO3d5axVmmqdbmM74upwfhrr/AesCHtnB
	SckYg+HZhvdRGESfH+/R8BZguCZ5GvviNJrdqqfUFslPNSv++Y3kP74yZeG4DjwU4eOvPmO6/eV
	ft0RgIdtll7tZ+73ZQiuX/ZPT6cnKg7ZV2b80BbNrLZwj1i3fcrpt04kY+bACdz9iuNpE7oa4s9
	oPMmQ05z5OP/zo2e4hDABvJ8hfm4KidKwuLj3P/WlkTzvUNuEUEo1Ozhv2/GbKC27Z+v9Nis3i6
	zyGgLki
X-Received: by 2002:a05:6000:18a2:b0:475:f0c2:5afe with SMTP id ffacd0b85a97d-47f8dca4f76mr389618f8f.52.1784752182154;
        Wed, 22 Jul 2026 13:29:42 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm9453665f8f.2.2026.07.22.13.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 13:29:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <194de1d4-6303-41bb-925c-dae08d382bd4@gmail.com>
Date: Wed, 22 Jul 2026 21:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
To: Arnd Bergmann <arnd@arndb.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260719022242.139472-1-julianbraha@gmail.com>
 <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
 <de25fc15-f438-4f8c-8c34-67b10dddab12@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <de25fc15-f438-4f8c-8c34-67b10dddab12@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 14:54, Arnd Bergmann wrote:
> The '(ARCH_QCOM || COMPILE_TEST)' is probably not even helpful
> here because QCOM_SOC also depends on that.

Nice catch, thanks Arnd. Will send a v2.

- Julian Braha
